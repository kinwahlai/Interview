//
//  PhoneNumber.swift
//  InterviewScreening
//
//  Created by Darren Lai on 5/14/19.
//  Copyright © 2019 Lai. All rights reserved.
//

import Cocoa

/**
 * Phone number validation, and formatter.
 * this class is immutable.
 **/
final class PhoneNumber: NSObject {
    static let USA = 0
    static let COUNTRY_CODES: [String] = ["1", "20", "212", "213", "216", "218", "220", "221", "222", "223",
                                          "224", "225", "226", "227", "228", "229", "230", "231", "232", "233",
                                          "234", "235", "236", "237", "238", "239", "240", "241", "242", "243",
                                          "244", "245", "246", "247", "248", "249", "250", "251", "252", "253",
                                          "254", "255", "256", "257", "258", "260", "261", "262", "263", "264",
                                          "265", "266", "267", "268", "269", "27", "290", "291", "297", "298",
                                          "299", "30", "31", "32", "33", "34", "350", "351", "352", "353",
                                          "354", "355", "356", "357", "358", "359", "36", "370", "371", "372",
                                          "373", "374", "375", "376", "377", "378", "380", "381", "385", "386",
                                          "387", "389", "39", "40", "41", "420", "421", "423", "43", "44",
                                          "45", "46", "47", "48", "49", "500", "501", "502", "503", "504",
                                          "505", "506", "507", "508", "509", "51", "52", "53", "5399", "54",
                                          "55", "56", "57", "58", "590", "591", "592", "593", "594", "595",
                                          "596", "597", "598", "599", "60", "61", "618", "62", "63", "64",
                                          "65", "66", "670", "672", "673", "674", "675", "676", "677", "678",
                                          "679", "680", "681", "682", "683", "684", "685", "686", "687", "688",
                                          "689", "690", "691", "692", "7", "808", "81", "82", "84", "850",
                                          "852", "853", "855", "856", "86", "870", "871", "872", "873", "874",
                                          "878", "880", "881", "8816", "8817", "88213", "88216", "886", "90", "91",
                                          "92", "93", "94", "95", "960", "961", "962", "963", "964", "965",
                                          "966", "967", "968", "970", "971", "972", "973", "974", "975", "976",
                                          "977", "98", "992", "993", "994", "995", "996", "998"]
    static let REASONS: [String] = ["Phone Number Too Long or Too Short", "US Number must be length 10", "Unknown Country Code"]
    
    /** The original value. */
    private var originalValue: String = ""
    
    // An index into the COUNTRY_CODES array
    private var countryCodeIndex: Int = USA
    private var strippedValue: String = ""
    private var invalidReason: String?
    
    init(_ originalValue: String) {
    }

    /**************************************************************************/
    /* Reduce the string to just numbers */
    private static func stripPhoneNumber(_ number: String) -> String
    {
        return ""
    }
    /**************************************************************************/
    private static func getCountryCodeIndex(_ strippedNumber: String) -> Int {
        return -1
    }
    /**************************************************************************/
    private static func validate(_ countryCodeIndex: Int, _ stripedNumber: String) -> String? {
        return countryCodeIndex == PhoneNumber.USA ? validateNorthAmerican(countryCodeIndex, stripedNumber) : validateInternational(countryCodeIndex, stripedNumber)
    }
    /**************************************************************************/
    /*
     *  International Phone number must be between 9-15 chars
     */
    private static func validateInternational(_ countryCodeIndex: Int, _ strippedNumber: String) -> String? {
        return nil
    }
    /**************************************************************************/
    private static func validateNorthAmerican(_ countryCodeIndex: Int, _ strippedNumber: String) -> String? {
        return extractPhoneBody(countryCodeIndex, strippedNumber)?.count == 10 ? nil : REASONS[1]
    }
    /**************************************************************************/
    private static func extractPhoneBody(_ countryCodeIndex: Int, _ strippedNumber: String) -> String? {
        return nil
    }
    /**************************************************************************/
    private static func getValueAsNorthAmerican(_ countryCodeIndex: Int, _ stripped: String) -> String? {
        return nil
    }
    /**************************************************************************/
    private static func getValueAsInternational(_ countryCodeIndex: Int, _ stripped: String) -> String? {
        return nil
    }
    /**************************************************************************/
    public func getValueAsNorthAmerican() -> String {
        return PhoneNumber.getValueAsNorthAmerican(countryCodeIndex, strippedValue) ?? ""
    }
    /**************************************************************************/
    public func getValueAsInternational() -> String {
        return PhoneNumber.getValueAsInternational(countryCodeIndex, strippedValue) ?? ""
    }
    /**************************************************************************/
    public func isValid() -> Bool {
        return invalidReason == nil
    }
    /**************************************************************************/
    public func getInvalidReason() -> String? {
        return invalidReason
    }
    /**************************************************************************/
    public func isNorthAmericanNumber() -> Bool {
        return countryCodeIndex == PhoneNumber.USA
    }
    /**************************************************************************/
    public func getOriginalText() -> String {
        return originalValue
    }
    /***********************************************************************/
    public func getStrippedNumber() -> String {
        return strippedValue
    }
}
