import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_app/modules/Ordering_Notifications/core/network/api_caller.dart';
import 'package:super_app/modules/Ordering_Notifications/core/utils/snackbar_message.dart';
import 'package:super_app/modules/Ordering_Notifications/core/widgets/custom_circular_progress_indicator.dart';
import 'package:super_app/modules/services/booking_entity.dart';
import 'package:super_app/shared/app_constants.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../domain/entities/AgentServiceResponseEntity.dart';
import '../../domain/useCase/AgentCalender_useCase.dart';
import '../../domain/useCase/agentServiceById_useCase.dart';
import '../../domain/useCase/getAgentServices_useCase.dart';
import '../../domain/useCase/service_useCase.dart';
import 'cubit/service_states.dart';
import 'cubit/service_view_model.dart';

class ServiceCalendarScreen extends StatefulWidget {
  const ServiceCalendarScreen({super.key});

  @override
  _ServiceCalendarScreenState createState() => _ServiceCalendarScreenState();
}

class _ServiceCalendarScreenState extends State<ServiceCalendarScreen> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  late DateTime fromDate;
  late DateTime toDate;
  late String selectedTimeSlot;

  // Default selected time slot
  ServiceScreenViewModel serviceViewModel = ServiceScreenViewModel(
    agentServiceUseCase: injectAgentServiceUseCase(),
    specificAgentServiceUseCase: injectSpecificAgentServiceUseCase(),
    serviceUseCase: injectServiceUseCase(),
    agentCalenderUseCase: injectAgentCalenderUseCase(),
  );

  @override
  void initState() {
    super.initState();
    // Initialize the dates with default values
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Service;
    BookingEntity.serviceId=args.serviceId!;


    return BlocProvider(
      create: (context) => serviceViewModel..getAgentCalender(args.id!),
      child: BlocBuilder<ServiceScreenViewModel, ServiceStates>(
        builder: (context, state) {
          if (state is ServiceLoadingState) {
            if(serviceViewModel.agentCalenderList != null &&serviceViewModel.agentCalenderList!.isNotEmpty) {
              print(serviceViewModel.agentCalenderList);
              return Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    backgroundColor: Colors.white,
                  ),
                ),
              );
            }
            else {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Pick A Time'),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Color(0xFF3DAB25)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  body: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Text(
                      "There is no available slots for this agent",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF3DAB25),
                        fontSize: 30,),),),
                  ),
                );
              }
          }
          else if (state is CalenderSuccessState) {
            if (serviceViewModel.agentCalenderList != null &&
                serviceViewModel.agentCalenderList!.isNotEmpty) {
              fromDate = DateTime.parse(
                  state.agentCalenderEntity.data!.first.fromDate!);
              toDate =
                  DateTime.parse(state.agentCalenderEntity.data!.first.toDate!);

              if (_focusedDay.isBefore(fromDate) ||
                  _focusedDay.isAfter(toDate)) {
                _focusedDay = fromDate;
              }

              return Scaffold(
                appBar: AppBar(
                  title: Text('Pick A Time'),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Color(0xFF3DAB25)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.asset(
                            'assets/images/doctor.png',
                            width: 92,
                            height: 92,
                          ),
                        ),
                        title: Text(
                          args.agentEnglishName!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          '${args.serviceAgentfees} EG',
                          style: TextStyle(color: Color(0xFF3DAB25),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TableCalendar(
                        calendarStyle: CalendarStyle(
                          selectedTextStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          todayTextStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          todayDecoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          selectedDecoration: BoxDecoration(
                            color: Color(0xFF12A770),
                            shape: BoxShape.circle,
                          ),
                        ),
                        firstDay: fromDate,
                        lastDay: toDate,
                        focusedDay: _focusedDay,
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDay, day);
                        },
                        onDaySelected: (selectedDay, focusedDay) {
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        },
                        headerStyle: HeaderStyle(
                          titleCentered: true,
                          formatButtonVisible: false,
                          titleTextStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text(
                          'Available Slots',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      SizedBox(height: 8),
                      Expanded(
                        child: SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: serviceViewModel.agentCalenderList
                                ?.length ?? 0,
                            itemBuilder: (context, index) {
                              final agent = serviceViewModel
                                  .agentCalenderList![index];
                              final initialSelectedTimeSlot = '4';
                              final availableTimeSlots = agent.slots!
                                  .split(',')
                                  .map((slot) => slot.trim())
                                  .toList();
                               selectedTimeSlot = initialSelectedTimeSlot;
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SizedBox(height: 10),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          childAspectRatio: 2.5,
                                        ),
                                        itemCount: availableTimeSlots.length,
                                        itemBuilder: (context, index) {
                                          String slot = availableTimeSlots[index];
                                          bool isSelected = slot ==
                                              selectedTimeSlot;

                                          return OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedTimeSlot = slot;
                                              });
                                            },
                                            child: Text(
                                              slot,
                                              style: TextStyle(
                                                color: isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontSize: 22,
                                              ),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: isSelected
                                                  ? Color(0xFF12A770)
                                                  : Colors.white,
                                              side: BorderSide(
                                                color: isSelected ? Color(
                                                    0xFF12A770) : Colors.grey,
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 24, vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(10.0),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: StatefulBuilder(
                          builder:(context,setState){
                            bool isLoading = false;
                            // ignore: dead_code
                            return isLoading?CustomCircularProgressIndicator(): ElevatedButton(
                              onPressed: () async{
                                setState(() {
                                  isLoading=true;
                                });
                                BookingEntity.mobileNumber="01123477676";
                                BookingEntity.consumerName="ahmed";
                                BookingEntity.dateTime=_selectedDay.toString();
                                log(_selectedDay.toString());
                                log(selectedTimeSlot);
                                log("${BookingEntity.categoryId} ${BookingEntity.providerId} ${BookingEntity.serviceId} ${BookingEntity.consumerName} ${BookingEntity.mobileNumber} ${BookingEntity.dateTime}");
                                log(serviceViewModel
                                    .agentCalenderList![0].serviceAgentId.toString());

                                try{
                                  final res = await ApiCaller.postHTTP("https://superapp-production.up.railway.app/createBooking", {
                                    "serviceId":BookingEntity.serviceId.toString(),
                                    "dateTime":BookingEntity.dateTime.toString(),
                                    "providerId":BookingEntity.providerId.toString(),
                                    "categoryId":BookingEntity.categoryId.toString(),
                                    "consumerName":AppConstants.cachedCurrentUserObject!.userName,
                                    "mobileNumber":AppConstants.cachedCurrentUserObject!.mobileNumber.toString(),
                                    "serviceAgentId" :serviceViewModel
                                        .agentCalenderList![0].serviceAgentId.toString()

                                  });
                                  log(res.toString());
                                  log(AppConstants.cachedCurrentUserObject!.mobileNumber.toString());
                                  SnackBarMessage.showSuccessSnackBar(message: "Booked", context: context);
                                }catch(e){
                                  SnackBarMessage.showSuccessSnackBar(message: e.toString(), context: context);

                                }
                                isLoading=false;
                                },

                              child: Text(
                                'CONFIRM DATE',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF04895C),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 52, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Pick A Time'),
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back, color: Color(0xFF3DAB25)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  body: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(child: Text(
                      "There is no available slots for this agent",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF3DAB25),
                        fontSize: 30,),),),
                  ),
                );
              }

          } else {
            return Container(
              color: Colors.white,
              child: Text(
               "There is no available slots "
              ),
            );
          }
        },
      ),
    );
  }
}
