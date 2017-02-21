import UIKit
import XCTest
import CCValidator

class TestCCValidator: XCTestCase {
    
    let americanExpressNumbers = [
        373867484422390, 377959119526293, 342030949859361,
        378809096932924, 340598394858882, 345459348424609,
        372313178485220, 370497105866404, 347914242888828
    ]
    
    let dankortsNumbers = [
        5019844570388446, 5019177660711544, 5019162014087205,
        5019836314808077, 5019557230220441, 5019878543154337,
        5019022650048152, 5019686352356533, 5019817222677267
    ]
    
    let dinersClubNumbers = [
        30362723320576, 38839617015257, 30087439675753,
        30067597907446, 38861398148347, 36083937810426,
        30127375921801, 30317110158260, 30253658981898
    ]
    
    let discoverNumbers = [
        6011243526028329, 6011805052205610, 6011295761811736,
        6011925617967577, 6011602231112746, 6011830444184299,
        6011386781305583, 6011798934501878, 6011713578534887
    ]
    
    let jcbNumbers = [
        3528062122672865, 3528732131260577, 3528130273272254,
        3529436157866312, 3529044702880703, 3529881648108024,
        3530028330154281, 3530007072603416, 3530826104585063,
        3538134440571448, 3538528721470602, 3538528721470602,
        3538134440571448, 3538528721470602, 3538553155017166,
        3589747852651222, 3589455441381166, 3589557082574742
    ]
    
    let maestroNumbers = [
        5001727212047753, 5088086101551532, 5053250127402556,
        5611441871300535, 5672202511820084, 5655020164413887,
        5721672747164328, 5726427502763664, 5761164217371006,
        5855743556375467, 5843654858187523, 5865524782687356,
        6145470530287158, 6181166256453322, 6136687433182548,
        6881043201118156, 6821260765587286, 6886553365358864,
        6921234438756007, 6913627014864535, 6972322312800062
    ]
    
    let masterCardNumbers = [
        5129187892858887, 5316089796332584, 5324168430436389,
        5430534412386192, 5357811976339638, 5492842318918850,
        5327977939468223, 5517428927289239, 5243501311144896
    ]
    
    let unionPayNumbers = [
        6252774803430257, 6270163082630407, 6203748303105452,
        6285616744641628, 6241712745548467, 6282074048647607,
        6270232347456872, 6270338628581583, 6270138235888375
    ]
    
    let visaNumbers = [
        4916743482352895, 4929115173208766, 4929111150993017,
        4532569705997925, 4532532346704936, 4539449005266755,
        4539647967252222, 4485278059645588, 4716218684717841,
        4916312540852, 4875293328226, 4539363085138,
        4485124016097, 4485888470472, 4532619444738,
        4556744269496, 4929217824669, 4485303685779
    ]
    
    let visaEletronNumbers = [
        4026822714436531, 4026876704511547, 4026708136587110,
        4175006618410151, 4175006107134254, 4175008866138385,
        4405432182452845, 4405074145776033, 4405252571817477,
        4508460883258076, 4508665737226075, 4508177462002150,
        4844674574513648, 4844076673470433, 4844217036488643,
        4913043770246047, 4913234258744773, 4913728443363605,
        4917872103882516, 4917618264737647, 4917555708382244
    ]
    
    let fakeCreditCardNumbers = [
        0, 12, 134, 1578, 187653, 122392389238923819,
        1234567890, 6666666666666666, 8888888888888, 111111111111111,
        090909090909, 1212121212, 33333, 444, 66, 1234123412341234
    ]
    
    //Fake Stripe test card numbers, our tests should mark them as validates OK
    let stripeTestNumbers = [
        // VISA
        4242424242424242, 4012888888881881, 4000056655665556,
        // MASTERCARD
        5555555555554444, 5200828282828210, 5105105105105100,
        // AMEX
        378282246310005, 371449635398431,
        // DISCOVER
        6011111111111117, 6011000990139424,
        // DINERS CLUB
        30569309025904, 38520000023237,
        // JCB
        3530111333300000, 3566002020360505
    ]
    
    let notNumbersStringInputs = [
        "12345678 ???", "A B C D", "1 2 E 4 S 6 7 B", "4242x24242424x42"
    ]
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNotRecognizedInit() {
        let validator = CCValidator(type: .NotRecognized)
        XCTAssertTrue(validator.prefixes.isEmpty,
                      "Validator created from not recognized type shouldn't have any prefixes")
        XCTAssertTrue(validator.lengths.isEmpty,
                      "Validator created from not recognized type shouldn't have any lengths")
    }
    
    func testAmericanExpress() {
        for ccNumber in americanExpressNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.AmericanExpress, recognizedType,
                           "\(numberAsString) card number should be recognized as American Express")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.AmericanExpress, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as American Express")
        }
    }
    
    func testDankort() {
        for ccNumber in dankortsNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.Dankort, recognizedType,
                           "\(numberAsString) card number should be recognized as Dankort")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.Dankort, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Dankort")
        }
        
    }
    
    func testDinersClub() {
        for ccNumber in dinersClubNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.DinersClub, recognizedType,
                           "\(numberAsString) card number should be recognized as Diners Club")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.DinersClub, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Diners Club")
        }
    }
    
    func testDiscover() {
        for ccNumber in discoverNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.Discover, recognizedType,
                           "\(numberAsString) card number should be recognized as Discover")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.Discover, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Discover")
        }
    }
    
    func testJCB() {
        for ccNumber in jcbNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.JCB, recognizedType,
                           "\(numberAsString) card number should be recognized as JCB")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.JCB, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as JCB")
        }
    }
    
    func testMaestro() {
        for ccNumber in maestroNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.Maestro, recognizedType,
                           "\(numberAsString) card number should be recognized as Maestro")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.Visa])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.Maestro, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Maestro")
        }
        
    }
    
    func testMasterCard() {
        for ccNumber in masterCardNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.MasterCard, recognizedType,
                           "\(numberAsString) card number should be recognized as Master Card")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.Visa])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.MasterCard, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Master Card")
        }
    }
    
    func testUnionPay() {
        for ccNumber in unionPayNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.UnionPay, recognizedType,
                           "\(numberAsString) card number should be recognized as Union Pay")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.UnionPay, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Union Pay")
        }
    }
    
    func testVisa() {
        for ccNumber in visaNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.Visa, recognizedType,
                           "\(numberAsString) card number should be recognized as Visa")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in masterCardNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.Visa, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Visa")
        }
    }
    
    func testVisaElectron() {
        for ccNumber in visaEletronNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertEqual(CreditCardType.VisaElectron, recognizedType,
                           "\(numberAsString) card number should be recognized as Visa Electron")
            let notRecognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString, checkOnlyFromTypes: [.MasterCard])
            XCTAssertEqual(notRecognizedType, .NotRecognized, "\(numberAsString)  should not be regognized, given types to check")
        }
        for ccNumber in masterCardNumbers {
            let numberAsString = String(ccNumber)
            let recognizedType = CCValidator.typeCheckingPrefixOnly(creditCardNumber: numberAsString)
            XCTAssertNotEqual(CreditCardType.VisaElectron, recognizedType,
                              "\(numberAsString) card number should NOT be recognized as Visa Electron")
        }
    }
    
    func testValidate() {
        let validCardNumbers = maestroNumbers + masterCardNumbers + visaNumbers + visaEletronNumbers
        for ccNumber in validCardNumbers {
            let numberAsString = String(ccNumber)
            let validated = CCValidator.validate(creditCardNumber: numberAsString)
            XCTAssertEqual(validated, true,
                           "\(numberAsString) card number should be validated as a correct one")
        }
        for ccNumber in stripeTestNumbers {
            let numberAsString = String(ccNumber)
            let validated = CCValidator.validate(creditCardNumber: numberAsString)
            XCTAssertEqual(validated, true,
                           "\(numberAsString) stripe test card number should be validated as a correct one")
        }
        for ccNumber in fakeCreditCardNumbers {
            let numberAsString = String(ccNumber)
            let validated = CCValidator.validate(creditCardNumber: numberAsString)
            XCTAssertEqual(validated, false,
                           "\(numberAsString) (false) card number should NOT be validated as a correct one")
        }
    }
    
    func testNotANumberInput() {
        for notANumber in notNumbersStringInputs {
            let validated = CCValidator.validate(creditCardNumber: notANumber)
            XCTAssertEqual(validated, false,
                           "\(notANumber) text should NOT be validated as a correct one")
        }
    }
}
