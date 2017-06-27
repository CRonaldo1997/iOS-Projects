//Question 1:
import Foundation

func isPalindrome(m:Int) -> Bool {
    if m == 0{  //if m equals 0, return true
    return true
    }
    var t = m
    var sum = 0
    
    while(t>0){ // to reverse m
        sum = 10*sum +  t%10
        t = t/10
    }
    
    return sum == m
}

func palindromeCount(n: Int) -> Int {
    var count = 0
    for number in 0...n{
        if isPalindrome(m: number){
            count += 1
        }
    }
return count
}

palindromeCount(n: 22)//test results



//Question 2:
func sumMultiples3_5(n: Int) -> Int {
    var sum = 0
    for number in 0...n-1{ // if use ..n, error happens, why?
        if number%3 == 0 && number%15 != 0{
           sum += number
        }
        else if number%5 == 0 && number%15 != 0{
           sum += number
        }
    }
    return sum
}
sumMultiples3_5(n: 20)//test results


//Question 3:
func patternCount(string:String,pattern:String) -> Int{
    var count = 0
    let length1 = string.characters.count
    let length2 = pattern.characters.count
    for num in 0...length1-length2{
        let start = string.index(string.startIndex,offsetBy:num)
        let end =  string.index(string.startIndex,offsetBy:num+length2)
        let range  = start..<end
        let subString = string.substring(with: range)
        print(subString)
        if subString == pattern{
            count += 1
        }
    }
    return count
}

patternCount(string: "abababa",pattern:"aba") //test results
patternCount(string: "aaaaa",pattern:"aa")
patternCount(string: "Abcde",pattern:"abc")


//Question4:
func popularClasses(arrOfSets: [Set<String>]) -> Set<String>{
    var resultSet:Set<String> = arrOfSets[0]
    for item in arrOfSets{
        resultSet = item.intersection(resultSet)
    }
    return resultSet
}
let studentA: Set = ["CS101","CS237","CS520", "aa"]
let studentB: Set = ["CS101","Math245","CS237", "aa"]
let studentC: Set = ["CS237","CS560", "aa"]
popularClasses(arrOfSets: [studentA,studentB,studentC]) //test result

//Question5:
func average(arrOfInts: [Int]) -> Double?{
    var sum = 0.0
    if arrOfInts.isEmpty {
       return nil
    }
    else
    {
        for num in arrOfInts{
            sum += Double(num)
        }
        let ava = sum/Double(arrOfInts.count)
        return ava
    }
}
average(arrOfInts: []) // test results
average(arrOfInts: [1,4,7,3])

//Question6: if an item is nil, count++?
func average1(arrOfInts:[Int?]) -> Double?{
    var sum = 0.0
    if arrOfInts.isEmpty {
        return nil
    }
    else
    {   var count = 0
        for item in arrOfInts{
            if let num = item{
               sum += Double(num)
               count += 1
            }
            else{
                print("The current item is nil")
            }
        }
        let ava = sum/Double(count)
        return ava
    }
}
average1(arrOfInts: [1,2,3,4,nil,nil])//result test

//Question7:
func digitDistribution (arr:[Int]) -> [Int:Int] {
    
    var resultDic = Dictionary<Int,Int>()
    var m = 0
    for num in arr{
        var t = num
        
        while t > 0 {
            m = t%10
            if resultDic.keys.contains(m) {
                resultDic[m] = resultDic[m]!+1
            }
            else{
                resultDic[m] = 1
            }
          t = t/10
        }
    }
    return resultDic
}
digitDistribution(arr: [112,24,15]) //test results

//Question8
func digitDistribution1 (numbers:[Int],count:Int) -> [Int:Int] {
    
    var resultDic = Dictionary<Int,Int>()
    var m = 0
    for num in numbers{
        var t = num
        
        while t > 0 {
            m = t%10
            if resultDic.keys.contains(m) {
                resultDic[m] = resultDic[m]!+1
            }
            else{
                resultDic[m] = 1
            }
            t = t/10
        }
    }
    for (num,cnt) in resultDic{
        if cnt < count{
            resultDic[num] = nil
        }
    }
    
    return resultDic
}
digitDistribution1(numbers: [112,24,15],count:1) //test results
digitDistribution1(numbers: [112,24,15],count:2)
digitDistribution1(numbers: [112,24,15],count:3)
digitDistribution1(numbers: [112,24,15],count:4)

//Question9:

func digitDistribution2 (numbers:[Int],count:Int = 2) -> [Int:Int] {
    
    var resultDic = Dictionary<Int,Int>()
    var m = 0
    for num in numbers{
        var t = num
        
        while t > 0 {
            m = t%10
            if resultDic.keys.contains(m) {
                resultDic[m] = resultDic[m]!+1
            }
            else{
                resultDic[m] = 1
            }
            t = t/10
        }
    }
    for (num,cnt) in resultDic{
        if cnt < count{
            resultDic[num] = nil
        }
    }
    
    return resultDic
}
digitDistribution2(numbers:[112,24,15], count: 3)//test result:
digitDistribution2(numbers:[112,24,15])

//Question10:

func digitDistribution3(count: Int) -> ([Int])->[Int : Int]{
    func NestedDigitDistribution(numbers:[Int]) -> [Int : Int]{
        var resultDic = Dictionary<Int,Int>()
        var m = 0
        for num in numbers{
            var t = num
            
            while t > 0 {
                m = t%10
                if resultDic.keys.contains(m) {
                    resultDic[m] = resultDic[m]!+1
                }
                else{
                    resultDic[m] = 1
                }
                t = t/10
            }
        }
        for (num,cnt) in resultDic{
            if cnt < count{
                resultDic[num] = nil
            }
        }
        
        return resultDic
    }
    return NestedDigitDistribution
}

let testA = digitDistribution3(count: 2) //test result
testA([112,24,15])
testA([111,42,4005])

let testB = digitDistribution3(count: 3)
testB([111,42,4005])

