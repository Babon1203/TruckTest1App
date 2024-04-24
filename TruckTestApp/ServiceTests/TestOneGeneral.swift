//
//  QuestionAndAnswer.swift
//  TruckTestApp
//
//  Created by Кирилл Саталкин on 19.04.2024.
//


import UIKit

class DataStore {
    static let shared = DataStore()

   struct Question {
        let text: String
        let answers: [String]
        let correctAnswer: String
    }
    var questionsAll: [[Question]] = []
    
    var questions1: [Question] = []
    var questions2: [Question] = []
   
    init() {
         loadQuestions()
     }
    
     private func loadQuestions() {
         
         questions1.append(contentsOf: [
            Question(text: "You should use your horn to:", answers: ["to let others know you are there", "to let others know you are about to increase your speed", "to let others know you are about to break", "to let others know you are an experienced driver"], correctAnswer: "to let others know you are there"),
          Question(text: "In an emergency, if you have to drive off the road you should:", answers: ["keep one set of wheels on the pavement, if possible", "avoid using the brakes until your speed has dropped", "stay on the shoulder (if possible) until your vehicle has come to a stop", "All of the above"], correctAnswer: "All of the above"),
            Question(text: "You should signal your intention to turn at least ___ before turning or changing lanes", answers: ["100 feet", "250 feet", "75 feet", "50 feet"], correctAnswer: "100 feet"),
            Question(text: "When you push the brake pedal down, air brakes work:", answers: ["after a short delay", "immediately", "only when ABS is working", "after about 15 seconds"], correctAnswer: "after a short delay"),
            Question(text: "If stopped on a hill, how can you start moving without rolling back?", answers: ["Release the parking brake before you have applied enough engine power to keep from rolling back", "Press on the gas pedal, even if you have to roll back a little", "Partly engage the clutch before you take your right foot off the brake, put on the parking brake if necessary", "None of the above"], correctAnswer: "Partly engage the clutch before you take your right foot off the brake, put on the parking brake if necessary"),
           Question(text: "If the safety relief valve in the air brake system releases air:", answers: ["this will supply more power to the brakes", "the valve is fully operational", "this will supply more power to the drive wheels", "something is wrong"], correctAnswer: "something is wrong"),
            Question(text: "When you take a break in the middle of your trip, you should check:", answers: ["tires, brakes, lights and cargo securement devices", "gauges for signs of trouble", "heater, defroster and windshield wiper blades", "missing exhaust pipes"], correctAnswer: "tires, brakes, lights and cargo securement devices"),
           Question(text: "The air tanks should be drained completely to remove:", answers: ["air", "the radiator cap", "water and oil", "carbon monoxide"], correctAnswer: "water and oil"),
           Question(text: "Emergency brakes must be held on by:", answers: ["hydraulic pressure", "mechanical force", "air pressure", "dynamic pressure"], correctAnswer: "mechanical force"),
           Question(text: "Older trailers do not have spring brakes. If the air supply leaks away:", answers: ["the trailer will stop normally", "there will be no emergency brakes", "the ABS won't work properly", "All of the above"], correctAnswer: "there will be no emergency brakes"),
            Question(text: "The earliest way to recognize that your trailer has started to skid is:", answers: ["by hearing squeaking noises from the wheels", "by checking the jackknife sensor", "by checking your mirrors", "by releasing the brakes"], correctAnswer: "by checking your mirrors"),
            Question(text: "Which of the following is NOT a hazard?", answers: ["An escape ramp", "A cardboard box on the road", "Work zones", "A freeway/highway exits that go downhill"], correctAnswer: "An escape ramp"),
            Question(text: "When stopping at the scene of an accident, you should NOT:", answers: ["report any qualified person who is at the accident and helping the injured", "notify authorities", "put on your 4-way emergency flashers", "set out reflective triangles"], correctAnswer: "report any qualified person who is at the accident and helping the injured"),
           Question(text: "Which of the following factors is NOT used to determine your safe speed when going down a long steep downgrade?", answers: ["Length and steepness of grade", "Time of day", "Weather", "Total weight of the vehicle and cargo"], correctAnswer: "Time of day"),
           Question(text: "When taking a curve you should:", answers: ["slightly exceed the posted speed limit for the curve, as this will help you keep control", "brake in the curve to avoid to locking the wheels", "maintain the same speed you were traveling at before entering the curve", "be in a gear that will let you accelerate slightly in the curve"], correctAnswer: "be in a gear that will let you accelerate slightly in the curve"),
            Question(text: "Axle weight is defined as:", answers: ["The maximum safe weight a tire can carry at a specified pressure", "The weight transmitted to the ground by one axle or one set of axles", "The weight of the trailer, including the axles", "None of the above"], correctAnswer: "The weight transmitted to the ground by one axle or one set of axles"),
            Question(text: "Whenever you are about to pass a pedestrian, bicyclist, or vehicle, you should assume that they:", answers: ["can see you", "are hard to see", "could suddenly move in front of you", "will move out of your lane of traffic"], correctAnswer: "could suddenly move in front of you"),
            Question(text: "When driving, you should be alert for:", answers: ["people who are distracted", "drivers whose vision is blocked", "sleepy drivers late at night", "All of the above"], correctAnswer: "All of the above"),
            Question(text: "Right after it starts to rain, the road is very slippery. Why?", answers: ["Because the water mixes with oil left on the road by vehicles", "Because rain is very slippery", "Because black ice may form on the road", "None of the above"], correctAnswer: "Because the water mixes with oil left on the road by vehicles"),
            Question(text: "You must have at least 4/32 inch tread depth in every major groove on front tires and at least ___ inch on other tires.", answers: ["2/32", "3/32", "4/32", "1/32"], correctAnswer: "2/32"),
            Question(text: "2Which of the following statements about drinking alcohol is true?", answers: ["Alcohol first affects judgment and self-control, which are necessary for safe driving", "Only time will sober you up", "The BAC measures the amount of alcohol in your body", "All of the above"], correctAnswer: "All of the above"),
            Question(text: "When you see a hazard that will require slowing down, you should:", answers: ["immediately come to a compolete stop", "warn the drivers behind by flashing your brake lights", "alert the drivers behind by pointing and sounding your horn", "speed up to pass the obstacle as quickly as possible"], correctAnswer: "warn the drivers behind by flashing your brake lights"),
           Question(text: "If another driver is following you too closely, you should:", answers: ["turn on your warning flashers", "immediately pull over to the side of the road", "decrease your following distance", "None of the above"], correctAnswer: "None of the above"),
            Question(text: "When approaching a vehicle as part of a pre-trip inspection, the driver should look under the vehicle for all of the following except:", answers: ["Fresh oil", "Grease", "Coolant", "Windshield wiper fluid"], correctAnswer: "Windshield wiper fluid"),
            Question(text: "You should you NOT sound your horn:", answers: ["to alert another driver to a potential problem", "to alert another driver to your presence", "to warn a pedestrian who may not have seen you", "to tell other drivers that they made a mistake"], correctAnswer: "to tell other drivers that they made a mistake")
            ])
         
            
         questions2.append(contentsOf: [
            Question(text: "Which of the following is NOT a warning sign of fatigue?", answers: ["Yawning repeatedly", "Trouble keeping your head up", "Trouble remembering the last few miles driven", "Engaging in conversation with a passenger"], correctAnswer: "Engaging in conversation with a passenger"),
            Question(text: "Loose engine belts will:", answers: ["will make it easier to stop quickly", "not turn the water pump and/or fan properly, which will result in overheating", "should not be tightened", "improve fuel efficiency"], correctAnswer: "not turn the water pump and/or fan properly, which will result in overheating"),
            Question(text: "Most heavy vehicles require ___ change gears", answers: ["single clutching", "triple shifting", "double clutching", "double shifting"], correctAnswer: "double clutching"),
           Question(text: "ABS will:", answers: ["increase your average speed", "shorten your stopping distance", "not give you more control over the vehicle during braking", "not change your normal braking capability"], correctAnswer: "not change your normal braking capability"),
            Question(text: "If brakes fail on a long downgrade, you should:", answers: ["turn off the engine as soon as you", "pump the brake pedal 3 times", "set the parking brake", "use an escape ramp if it is available"], correctAnswer: "use an escape ramp if it is available"),
           Question(text: "The posted speed limit:", answers: ["should only be exceeded when passing other vehicles", "is only a suggestion", "should never be exceeded", "may only be exceeded when driving in rural areas"], correctAnswer: "should never be exceeded"),
            Question(text: "The use of brakes on a steep downgrade is:", answers: ["much more effective than the engine braking effect", "a supplement to the braking effect of the engine", "the main braking factor", "dangerous, and should be avoided at all costs"], correctAnswer: "a supplement to the braking effect of the engine"),
            Question(text: "When you discover a fire, if the trailer doors are hot you should not open them because:", answers: ["with air many fires do less damage", "the temperature of the trailer should not be changed in any way", "you should use the fire extinguisher on the door", "opening the doors lets air in and may make the fire flare up"], correctAnswer: "opening the doors lets air in and may make the fire flare up"),
            Question(text: "Hydroplaning is most likely to occur:", answers: ["right after it starts to rain", "when it's been raining for over an hour", "at speeds below 30 mph", "right before it starts to rain"], correctAnswer: "right after it starts to rain"),
            Question(text: "Which of the following is considered a serious traffic violation?", answers: ["Excessive speeding (15 mph or more above the posted limit)", "Reckless driving", "Following a vehicle too closely", "All of the above"], correctAnswer: "All of the above"),
            Question(text: " ___ of sleep or less triples your risk of falling asleep at the wheel.", answers: ["10 hours", "6 hours", "3 hours", "4 hours"], correctAnswer: "6 hours"),
            Question(text: "Which of these can cause your vehicle to skid?", answers: ["Braking any harder than necessary on slippery roads", "Over acceleration", "Over steering", "All of the above"], correctAnswer: "All of the above"),
          Question(text: "Truck tractors with air brakes built after March 1, 1997, are required to be equipped with:", answers: ["anti-lock brakes", "hydraulic brakes", "GPS", "a rear backup camera"], correctAnswer: "anti-lock brakes"),
            Question(text: "When driving a 50 foot vehicle at 50 mph, how much space should you keep in front of you?", answers: ["4 seconds", "6 seconds", "5 seconds", "3 seconds"], correctAnswer: "6 seconds"),
            Question(text: "If confronted by an aggressive driver, you should:", answers: ["ignore gestures", "make gestures", "try to stay in front of them", "react to gestures"], correctAnswer: "ignore gestures"),
         Question(text: "When the road is very slippery, you should:", answers: ["use the parking brake instead of the service brake", "downshift to stop", "apply the brakes often to keep the linings dry", "stop at the first safe place"], correctAnswer: "stop at the first safe place"),
          Question(text: "When driving on a slippery surface, you should do all of the following except:", answers: ["keep a shorter following distance", "watch far enough ahead to keep a steady speed", "not pass slower vehicles unless necessary", "adjust braking to conditions"], correctAnswer: "keep a shorter following distance"),
           Question(text: "You should always be looking for hazards to have time to plan a way out of any emergency. This is part of being a:", answers: ["modular driver", "reasonable driver", "defensive driver", "good enough driver"], correctAnswer: "defensive driver"),
           Question(text: "The Gross Combination Weight (GCW) is:", answers: ["the total weight of a single vehicle including its load", "the weight of the vehicle, trailer, and cargo", "the weight of the vehicle and its trailers)", "the weight of the trailer and cargo"], correctAnswer: "the weight of the vehicle, trailer, and cargo"),
            Question(text: "Empty trucks have the best braking. True or False?", answers: ["It depends on the truck", "True", "False", "It depends on the cargo"], correctAnswer: "False"),
            Question(text: "Your chances of avoiding an accident depend upon how well you take action. When you are about to hit an obstacle ahead, you should remember that:", answers: ["stopping is always the safest thing to do in an emergency", "leaving the road is more risky than hitting another vehicle", "you can almost always turn to miss an obstacle more quickly than you can stop", "All of the above"], correctAnswer: "you can almost always turn to miss an obstacle more quickly than you can stop"),
            Question(text: "To prevent drowsiness and maintain alertness, adults need ___ hours of sleep.", answers: ["7-8 hours", "3-4 hours", "11-12 hours", "5-6 hours"], correctAnswer: "7-8 hours"),
            Question(text: "The ___ applies and releases the brakes when you use the brake pedal during normal driving.", answers: ["parking brake system", "trailer brake system", "emergency brake system", "service brake system"], correctAnswer: "service brake system"),
            Question(text: "The tractor protection valve:", answers: ["keeps your wheels from locking up when you brake hard", "keeps air in the brake system should the trailer develop a bad leak", "prevents the trailer from being accidentally released", "keeps air from going out if the air compressor develops a leak"], correctAnswer: "keeps air in the brake system should the trailer develop a bad leak"),
            Question(text: "Which of the following statements about tire failure is true?", answers: ["If the steering feels heavy, it may be a sign one of the rear tires has failed", "Any time you hear a tire blow, you would be safest to assume it is not yours", "It can take a few seconds for your vehicle to react, and you might think it was some other vehicle", "All of the above"], correctAnswer: "It can take a few seconds for your vehicle to react, and you might think it was some other vehicle")
            ])
         self.questionsAll += [questions1, questions2]
        
        }
 
    }
