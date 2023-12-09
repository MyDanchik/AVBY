import UIKit
struct Car {
    let name: String
    let price: String
    let info: String
    let location: String
    let image: [UIImage]
}


private let car1 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "2021 г., робот, 2.0 л, бензин, 91 000 км, седан, полный привод, серый",
                       location: "г.Минск1",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ])


private let car2 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "2021 г., робот, 2.0 л, бензин, 91 000 км, седан, полный привод, серый",
                       location: "г.Минск2",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ])


private let car3 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "2021 г., робот, 2.0 л, бензин, 91 000 км, седан, полный привод, серый",
                       location: "г.Минск3",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ])


private let car4 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "2021 г., робот, 2.0 л, бензин, 91 000 км, седан, полный привод, серый",
                       location: "г.Минск4",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ])


private let car5 = Car(name: "Audi A4 B9 · Рестайлинг",
                       price: "102106",
                       info: "2021 г., робот, 2.0 л, бензин, 91 000 км, седан, полный привод, серый",
                       location: "г.Минск5",
                       image: [
                        UIImage(named: "1")!,
                        UIImage(named: "2")!,
                        UIImage(named: "1")!,
                       ])


let infoCar : [String] = [
    car1.info,
    car2.info,
    car3.info,
    car4.info,
    car5.info
]

let locationCar : [String] = [
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
