import UIKit

private let car1 = Car(name: "Audi A4 B9",
                       price: "61879",
                       info: "Информация1",
                       year: "2016г.",
                       gearbox: "робот",
                       scope: "2.0 л",
                       engineType: "дизель",
                       mileage: "179 000 км",
                       bodyType: "универсал",
                       drive: "передний привод",
                       color: "белый",
                       location: "г.Минск",
                       date: "18 октября",
                       image: [
                        UIImage(named: "Audi1_1")!,
                        UIImage(named: "Audi1_3")!,
                        UIImage(named: "Audi1_2")!,
                        UIImage(named: "Audi1_4")!,
                        UIImage(named: "Audi1_5")!,
                        UIImage(named: "Audi1_6")!,
                       ],
                       top: true,
                       vin: true,
                       equipment: ["ABS1", "LED2", "Turbo3"],
                       exchange: "Продавца не интересует обмен")


private let car2 = Car(name: "Audi A6 C8",
                       price: "129788",
                       info: "Информация2",
                       year: "2019",
                       gearbox: "робот",
                       scope: "2.0",
                       engineType: "дизель",
                       mileage: "65 000",
                       bodyType: "седан",
                       drive: "передний привод",
                       color: "синий",
                       location: "г.Минск",
                       date: "13 декабря",
                       image: [
                        UIImage(named: "Audi2_1")!,
                        UIImage(named: "Audi2_2")!,
                        UIImage(named: "Audi2_3")!,
                        UIImage(named: "Audi2_4")!,
                        UIImage(named: "Audi2_5")!,
                        UIImage(named: "Audi1_2")!,
                       ],
                       top: true,
                       vin: false, equipment: ["ABS", "LED", "Turbo"],
                       exchange: "неа")


private let car3 = Car(name: "Audi Q5 FY · Рестайлинг",
                       price: "141180",
                       info: "Информация3",
                       year: "2021",
                       gearbox: "робот",
                       scope: "2.0",
                       engineType: "бензин",
                       mileage: "22 000",
                       bodyType: "внедорожник",
                       drive: "полный привод",
                       color: "белый",
                       location: "г.Минск1",
                       date: "12 декабря",
                       image: [
                        UIImage(named: "Audi3_1")!,
                        UIImage(named: "Audi3_2")!,
                        UIImage(named: "Audi3_3")!,
                        UIImage(named: "Audi3_4")!,
                        UIImage(named: "Audi3_5")!,
                        UIImage(named: "Audi3_6")!,
                       ],
                       top: false,
                       vin: false, equipment: ["ABS132", "LED321", "Turbo"],
                       exchange: "неа")


private let car4 = Car(name: "Audi A4 B9",
                       price: "61879",
                       info: "Информация",
                       year: "2016г.",
                       gearbox: "робот",
                       scope: "2.0 л",
                       engineType: "дизель",
                       mileage: "179 000 км",
                       bodyType: "универсал",
                       drive: "передний привод",
                       color: "белый",
                       location: "г.Минск",
                       date: "18 октября",
                       image: [
                        UIImage(named: "Audi1_1")!,
                        UIImage(named: "Audi1_3")!,
                        UIImage(named: "Audi1_2")!,
                        UIImage(named: "Audi1_4")!,
                        UIImage(named: "Audi1_5")!,
                        UIImage(named: "Audi1_6")!,
                       ],
                       top: true,
                       vin: true, equipment: ["ABS", "LED", "Turbo"],
                       exchange: "неа")


private let car5 = Car(name: "Audi A6 C8",
                       price: "129788",
                       info: "Информация",
                       year: "2019",
                       gearbox: "робот",
                       scope: "2.0",
                       engineType: "дизель",
                       mileage: "65 000",
                       bodyType: "седан",
                       drive: "передний привод",
                       color: "синий",
                       location: "г.Минск",
                       date: "13 декабря",
                       image: [
                        UIImage(named: "Audi2_1")!,
                        UIImage(named: "Audi2_2")!,
                        UIImage(named: "Audi2_3")!,
                        UIImage(named: "Audi2_4")!,
                        UIImage(named: "Audi2_5")!,
                        UIImage(named: "Audi1_2")!,
                       ],
                       top: true,
                       vin: false, equipment: ["ABS", "LED", "Turbo"],
                       exchange: "неа")


// Массивы для работы с данными
let cars = [car1, car2, car3, car4, car5]

let infoCar = cars.map { $0.info }
let yearCar = cars.map { $0.year }
let gearboxCar = cars.map { $0.gearbox }
let scopeCar = cars.map { $0.scope }
let engineTypeCar = cars.map { $0.engineType }
let mileageCar = cars.map { $0.mileage }
let bodyTypeCar = cars.map { $0.bodyType }
let driveCar = cars.map { $0.drive }
let colorCar = cars.map { $0.color }
let locationCar = cars.map { $0.location }
let nameCar = cars.map { $0.name }
let priceCar = cars.map { $0.price }
let imageCar = cars.map { $0.image }
var topCar = cars.map { $0.top }
var vinCar = cars.map { $0.vin }
let dateCar = cars.map { $0.date }
let equipmentCar = cars.map { $0.equipment }
let exchangeCar = cars.map { $0.exchange}

