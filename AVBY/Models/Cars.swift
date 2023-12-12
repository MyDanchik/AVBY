import UIKit
struct Car {
    let name: String
    let price: String
    let info: String
    let year: String
    let gearbox: String
    let scope: String
    let engineType: String
    let mileage: String
    let bodyType: String
    let drive: String
    let color: String
    let location: String
    let date: String
    let image: [UIImage]
    var top: Bool
    var vin: Bool
}


private let car1 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "Информация",
                       year: "2021г.",
                       gearbox: "механика",
                       scope: "2.0 л",
                       engineType: "бензин",
                       mileage: "91 000 км",
                       bodyType: "седан",
                       drive: "полный привод",
                       color: "серый",
                       
                       location: "г.Минск1",
                       date: "1 декабря",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ],
                       top: true,
                       vin: true)


private let car2 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "Информация",
                       year: "2021",
                       gearbox: "механика",
                       scope: "2.0",
                       engineType: "бензин",
                       mileage: "91 000",
                       bodyType: "седан",
                       drive: "полный привод",
                       color: "серый",
                       
                       location: "г.Минск1",
                       date: "1 декабря",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ],
                       top: true,
                       vin: false)


private let car3 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "Информация",
                       year: "2021",
                       gearbox: "механика",
                       scope: "2.0",
                       engineType: "бензин",
                       mileage: "91 000",
                       bodyType: "седан",
                       drive: "полный привод",
                       color: "серый",
                       
                       location: "г.Минск1",
                       date: "1 декабря",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ],
                       top: false,
                       vin: false)


private let car4 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "Информация",
                       year: "2021",
                       gearbox: "механика",
                       scope: "2.0",
                       engineType: "бензин",
                       mileage: "91 000",
                       bodyType: "седан",
                       drive: "полный привод",
                       color: "серый",
                       
                       location: "г.Минск1",
                       date: "1 декабря",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ],
                       top: true,
                       vin: true)


private let car5 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "Информация",
                       year: "2021",
                       gearbox: "механика",
                       scope: "2.0",
                       engineType: "бензин",
                       mileage: "91 000",
                       bodyType: "седан",
                       drive: "полный привод",
                       color: "серый",
                       
                       location: "г.Минск1",
                       date: "1 декабря",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ],
                       top: true,
                       vin: true)


let infoCar: [String] = [
    car1.info,
    car2.info,
    car3.info,
    car4.info,
    car5.info
]
let yearCar: [String] = [
    car1.year,
    car2.year,
    car3.year,
    car4.year,
    car5.year
]
let gearboxCar: [String] = [
    car1.gearbox,
    car2.gearbox,
    car3.gearbox,
    car4.gearbox,
    car5.gearbox
]
let scopeCar: [String] = [
    car1.scope,
    car2.scope,
    car3.scope,
    car4.scope,
    car5.scope
]
let engineTypeCar: [String] = [
    car1.engineType,
    car2.engineType,
    car3.engineType,
    car4.engineType,
    car5.engineType
]
let mileageCar: [String] = [
    car1.mileage,
    car2.mileage,
    car3.mileage,
    car4.mileage,
    car5.mileage
]
let bodyTypeCar: [String] = [
    car1.bodyType,
    car2.bodyType,
    car3.bodyType,
    car4.bodyType,
    car5.bodyType
]
let driveCar: [String] = [
    car1.drive,
    car2.drive,
    car3.drive,
    car4.drive,
    car5.drive
]
let colorCar: [String] = [
    car1.color,
    car2.color,
    car3.color,
    car4.color,
    car5.color
]
let locationCar: [String] = [
    car1.location,
    car2.location,
    car3.location,
    car4.location,
    car5.location
]

let nameCar: [String] = [
    car1.name,
    car2.name,
    car3.name,
    car4.name,
    car5.name
]
let priceCar: [String] = [
    car1.price,
    car2.price,
    car3.price,
    car4.price,
    car5.price
]
let imageCar = [
    car1.image,
    car2.image,
    car3.image,
    car4.image,
    car5.image
]

var topCar = [
    car1.top,
    car2.top,
    car3.top,
    car4.top,
    car5.top
]

var vinCar = [
    car1.vin,
    car2.vin,
    car3.vin,
    car4.vin,
    car5.vin
]

let dateCar = [
    car1.date,
    car2.date,
    car3.date,
    car4.date,
    car5.date
]
