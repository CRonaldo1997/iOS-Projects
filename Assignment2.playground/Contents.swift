import Foundation

//Problem1:
enum Currency{
    case Euro(String,String,Float)
    case US_Dollar(String,String,Float)
    case Indian_Rupee(String,String,Float)
    case Mexican_Peso(String,String,Float)
}
let eur = Currency.Euro("EUR","\u{20AC}",0.8904)
let dollar = Currency.US_Dollar("USD","\u{24}",1)
let rupee = Currency.Indian_Rupee("INR","\u{20B9}",66.7)
let peso = Currency.Mexican_Peso("MXN","\u{24}",18.88)






//Problem2:
struct Money{
    let money_type: Currency
    let amount: Float
   
   //Plus function:
   static func +(left:Money,right:Money) -> Money {
    switch left.money_type{
    case let .Euro(code_l,symbol_l,rate_l):
        switch right.money_type{
        case let .Euro(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
        case let .US_Dollar(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
        case let .Indian_Rupee(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
        case let .Mexican_Peso(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
        }
    
    case let .US_Dollar(code_l,symbol_l,rate_l):
        switch right.money_type{
        case let .Euro(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
        case let .US_Dollar(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
        case let .Indian_Rupee(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
        case let .Mexican_Peso(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
        }
    
    case let .Indian_Rupee(code_l,symbol_l,rate_l):
        switch right.money_type{
        case let .Euro(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
        case let .US_Dollar(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
        case let .Indian_Rupee(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
        case let .Mexican_Peso(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
        }
   
    case let .Mexican_Peso(code_l,symbol_l,rate_l):
        switch right.money_type{
        case let .Euro(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
        case let .US_Dollar(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
        case let .Indian_Rupee(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
        case let .Mexican_Peso(_,_,rate_r):
            let sum: Float = left.amount + right.amount*(rate_l/rate_r)
            return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
        }
    }
}

    
    //Minus function:
    static func -(left:Money,right:Money) -> Money {
        switch left.money_type{
        case let .Euro(code_l,symbol_l,rate_l):
            switch right.money_type{
            case let .Euro(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
            case let .US_Dollar(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
            case let .Indian_Rupee(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
            case let .Mexican_Peso(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Euro(code_l, symbol_l, rate_l), amount: sum)
            }
            
        case let .US_Dollar(code_l,symbol_l,rate_l):
            switch right.money_type{
            case let .Euro(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
            case let .US_Dollar(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
            case let .Indian_Rupee(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
            case let .Mexican_Peso(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .US_Dollar(code_l, symbol_l, rate_l), amount: sum)
            }
            
        case let .Indian_Rupee(code_l,symbol_l,rate_l):
            switch right.money_type{
            case let .Euro(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
            case let .US_Dollar(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
            case let .Indian_Rupee(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
            case let .Mexican_Peso(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Indian_Rupee(code_l, symbol_l, rate_l), amount: sum)
            }
            
        case let .Mexican_Peso(code_l,symbol_l,rate_l):
            switch right.money_type{
            case let .Euro(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
            case let .US_Dollar(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
            case let .Indian_Rupee(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
            case let .Mexican_Peso(_,_,rate_r):
                let sum: Float = left.amount - right.amount*(rate_l/rate_r)
                return Money(money_type: .Mexican_Peso(code_l, symbol_l, rate_l), amount: sum)
            }
        }
    }
    
    
   // Discription function
    func description()->String{
        switch self.money_type{
        case let .Euro(code, symbol, _):
            return symbol+String(amount)+" "+code
        case let .US_Dollar(code, symbol, _):
            return symbol+String(amount)+" "+code
        case let .Indian_Rupee(code, symbol, _):
            return symbol+String(amount)+" "+code
        case let .Mexican_Peso(code, symbol, _):
            return symbol+String(amount)+" "+code
        }
    }
    
}
//Problem2 test:
let euro = Money(money_type: eur,amount: 2000)
let usd = Money(money_type:dollar,amount:3000)
let inr = Money(money_type:rupee,amount:700)
let mxn = Money(money_type:peso,amount:700)
let sum_1 = inr + mxn
let sum_2 = inr + usd
let difference_1 = usd - euro
let difference_2 = mxn - inr
sum_1.description()
sum_2.description()
difference_1.description()
difference_2.description()






//Problem3:
extension String{
    func phoneFormat() -> String{
       var tempString = ""
        for c in self.characters{
            if c>="0" && c<="9"{
             tempString += String(c)
            }
        }
        let start1 = tempString.index(tempString.startIndex, offsetBy:0)
        let end1 = tempString.index(tempString.startIndex, offsetBy:3)
        let start2 = tempString.index(tempString.startIndex, offsetBy:3)
        let end2 = tempString.index(tempString.startIndex, offsetBy:6)
        let start3 = tempString.index(tempString.startIndex, offsetBy:6)
        let end3 = tempString.index(tempString.startIndex, offsetBy:10)
        
        let subString1 = tempString.substring(with: start1..<end1)
        let subString2 = tempString.substring(with: start2..<end2)
        let subString3 = tempString.substring(with: start3..<end3)
    
        return subString1+"-"+subString2+"-"+subString3
    }
}
//Problem3 test:
"6195946191".phoneFormat()
"619 594 6191".phoneFormat()
"619 5946191".phoneFormat()
"619-594-6191".phoneFormat()






//Problem4:
enum Phone_Type{
    case moblie
    case home
    case work
    case main
    case home_fax
    case work_fax
    case pager
    case other
}

struct PhoneNumber{
    let type: Phone_Type
    let number: String
    init(num:String){
        type = Phone_Type.home
        number = num
    }
    init(pt:Phone_Type,num:String) {
        number = num
        type = pt
    }
    func isMoblie() -> Bool{
        switch self.type {
        case .moblie:
            return true
        default:
            return false
        }
    }
    
    func isLocal() -> Bool{
        let str = self.number
        let start = str.index(str.startIndex,offsetBy:0)
        let end = str.index(str.startIndex,offsetBy:3)
        let range = start..<end
        let subStr = str.substring(with:range)
        if subStr == "619" || subStr == "858"{
            return true
        }
        else{
            return false
            }
    }
    
    func description()->String{
        return (String(describing: self.type)+":"+self.number)
    }
}
let s1 = PhoneNumber(num:"8282609304".phoneFormat())
let s2 = PhoneNumber(pt:Phone_Type.moblie,num:"6192345678".phoneFormat())
//Problem4 test:
s1.isMoblie()
s2.isMoblie()
s1.isLocal()
s2.isLocal()
s1.description()
s2.description()






//Problem5:
extension String{
    func asPhoneNumber() -> PhoneNumber?{
        let sArr = self.components(separatedBy: ":")
        
        if sArr[1] != sArr[1].phoneFormat(){
            return nil
        }
        
        if sArr[0]==String(describing: Phone_Type.home){
            return PhoneNumber(pt:Phone_Type.home,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.moblie){
            return PhoneNumber(pt:Phone_Type.moblie,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.home_fax){
            return PhoneNumber(pt:Phone_Type.home_fax,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.main){
            return PhoneNumber(pt:Phone_Type.main,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.other){
            return PhoneNumber(pt:Phone_Type.other,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.pager){
            return PhoneNumber(pt:Phone_Type.pager,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.work){
            return PhoneNumber(pt:Phone_Type.work,num:sArr[1])
        }
        else if sArr[0]==String(describing: Phone_Type.work_fax){
            return PhoneNumber(pt:Phone_Type.work_fax,num:sArr[1])
        }
        else{
            return nil
        }
    }
}
//Problem5 test:
"work:619-345-0000".asPhoneNumber()?.number
"other:619-345-1234".asPhoneNumber()?.type
"gym:8582609012".asPhoneNumber()






//Problem6:
struct Name : Comparable{
    let first_name: String
    let last_name: String
    
    static func ==(lhs:Name,rhs:Name) -> Bool{
        return lhs.first_name == rhs.first_name && lhs.last_name == lhs.last_name
    }
    static func >(lhs:Name,rhs:Name) -> Bool{
        let fullName_l = lhs.first_name+lhs.last_name
        let fullName_r = rhs.first_name+rhs.last_name
        return fullName_l > fullName_r
    }
    static func >=(lhs:Name,rhs:Name) -> Bool{
        let fullName_l = lhs.first_name+lhs.last_name
        let fullName_r = rhs.first_name+rhs.last_name
        return fullName_l >= fullName_r
    }
    static func <(lhs:Name,rhs:Name) -> Bool{
        let fullName_l = lhs.first_name+lhs.last_name
        let fullName_r = rhs.first_name+rhs.last_name
        return fullName_l < fullName_r
    }
    static func <=(lhs:Name,rhs:Name) -> Bool{
        let fullName_l = lhs.first_name+lhs.last_name
        let fullName_r = rhs.first_name+rhs.last_name
        return fullName_l <= fullName_r
    }
}
//Problem6 test:
let student_1 = Name(first_name: "Dong",last_name: "Jiang")
let student_2 = Name(first_name: "Hot",last_name: "Dog")
let student_3 = Name(first_name: "Dong",last_name: "Jiang")
student_1  == student_2
student_1  == student_3
student_1 < student_2
student_1 > student_2
student_1 >= student_2
student_1 <= student_2
student_1 >= student_3
student_1 <= student_3






//Question7:
class Person{
    let name : Name
    var phone_num : [PhoneNumber?]
    
    init(name:Name,phone_num:[PhoneNumber?]) {
        self.name = name
        self.phone_num = phone_num
    }

func addPhoneNumber(phoneNum:String,phoneType:Phone_Type=Phone_Type.home ){
    let newPhoneNum = PhoneNumber(pt:phoneType,num:phoneNum)
    phone_num.append(newPhoneNum)
    }

func addPhoneNumber(phoneNum:PhoneNumber){
    let newPhoneNum = PhoneNumber(pt:phoneNum.type,num:phoneNum.number)
    phone_num.append(newPhoneNum)
    }


   func phoneNumber(phoneType: Phone_Type) -> PhoneNumber?{
    if self.phone_num.isEmpty{
        return nil
    }
    else{
        for phoneNum in self.phone_num{
            print(phoneType)
            if phoneNum!.type == phoneType{
                
                return phoneNum
            }
        }
        return nil
    }
    }


func hasNumber(Number:String) -> Bool{
    if phone_num.isEmpty{
        return false
    }
    else{
        for phoneNum in phone_num{
            if phoneNum?.number == Number{
            return true
            }
        }
    }
    return false
}
}
//Problem7 test:
let person_name = Name(first_name: "Dong",last_name: "Jiang")
let person_number_1 = PhoneNumber(pt:Phone_Type.moblie,num:"8582609305".phoneFormat())
var person_1 = Person(name:person_name,phone_num:[person_number_1])
person_1.addPhoneNumber(phoneNum: "6194567984".phoneFormat())
person_1.addPhoneNumber(phoneNum: "8581234567".phoneFormat(), phoneType:Phone_Type.work)
let person_number_2 = PhoneNumber(pt:Phone_Type.home_fax,num:"6192346666".phoneFormat())
person_1.addPhoneNumber(phoneNum: person_number_2)

person_1.name.first_name
person_1.name.last_name
person_1.phone_num
person_1.phoneNumber(phoneType: Phone_Type.moblie)?.description()
person_1.hasNumber(Number: "8582609305".phoneFormat())
person_1.hasNumber(Number: "1234567890".phoneFormat())






//Question8:
class ContactList{
    var personList : [Person?]=[]
    func addPerson(person:Person){
        personList.append(person)
    }
    
    func orderedByName() -> [Person]{
        var tempPerson = person_1
        for i in 0..<((personList.count)-1){
            for j in 0..<((personList.count)-1-i){
                if personList[j]!.name.last_name > (personList[j+1]!.name.last_name){
                    tempPerson = personList[j]!
                    personList[j] = personList[j+1]
                    personList[j+1] = tempPerson
                    }
            }
        }
    return personList as! [Person]
    }
    
    func phoneNumberFor(lastName:String) -> [PhoneNumber?]{
        for person in personList{
            if person?.name.last_name == lastName{
                if let numbers = person?.phone_num{
                return numbers
                }
                else{
                    return [nil]
                }
            }
        }
        return [nil]
    }
    
    func nameForNumber(number:String) -> Person?{
        for person in personList{
            for nums in (person?.phone_num)!{
                if nums?.number == number{
                    return person
                }
            }
        }
        return nil
    }
    
    func showContacts(){
        for person in self.personList{
            print(person?.name.first_name,person?.name.last_name)
        }
    }
}
//Problem8 test
//create person2
let personName_2 = Name(first_name: "Jobs",last_name: "Steve")
let personNumber_2 = PhoneNumber(pt:Phone_Type.moblie,num:"8582609300".phoneFormat())
var person_2 = Person(name:personName_2,phone_num:[personNumber_2])

//create person3
let personName_3 = Name(first_name: "Gates",last_name: "Bill")
let personNumber_3 = PhoneNumber(pt:Phone_Type.moblie,num:"8581234567".phoneFormat())
var person_3 = Person(name:personName_3,phone_num:[personNumber_3])

//create person4
let personName_4 = Name(first_name: "Owner",last_name: "Mick")
let personNumber_4 = PhoneNumber(pt:Phone_Type.moblie,num:"8586704546".phoneFormat())
var person_4 = Person(name:personName_4,phone_num:[personNumber_4])

var contacts = ContactList()
contacts.addPerson(person: person_2)
contacts.addPerson(person: person_3)
contacts.addPerson(person: person_4)
print("Before sort by last name")
contacts.showContacts()

contacts.orderedByName()
print("After sort by last name")
contacts.showContacts()

contacts.phoneNumberFor(lastName: "Bill")
contacts.phoneNumberFor(lastName: "Jiang")
contacts.nameForNumber(number: "8586704546".phoneFormat())?.name.last_name
contacts.nameForNumber(number: "8586712346".phoneFormat())



