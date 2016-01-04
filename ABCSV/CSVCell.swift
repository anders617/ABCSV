import Foundation

public enum CSVCell:CustomStringConvertible {
    case Header(contents:String)
    case Text(contents:String)
    case Integer(contents:Int)
    case Decimal(contents:Double)
    case Date(contents:NSDate)
    case Empty
    
    public init(string:String) {
        //TODO:Better date parsing
        let cleanString = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if let date = NSDateFormatter().dateFromString(cleanString) {self = .Date(contents: date)}
        else if let decimal = Double(cleanString) {self = .Decimal(contents: decimal)}
        else if let integer = Int(cleanString) {self = .Integer(contents: integer)}
        else if cleanString.characters.count > 0 {self = .Text(contents: cleanString)}
        else {self = .Empty}
    }
    
    public var description:String {
        switch self {
        case .Header(let header): return header
        case .Text(let text): return text
        case .Integer(let integer):return integer.description
        case .Decimal(let decimal):return decimal.description
        case .Date(let date): return date.description
        case Empty: return ""
        }
    }
    
    public var typeDescription:String {
        switch self {
        case .Header(_): return "Header"
        case .Text(_): return "Text"
        case .Integer(_): return "Integer"
        case .Decimal(_): return "Decimal"
        case .Date(_): return "Date"
        case .Empty: return "Empty"
        }
    }
    
    public var value:Any? {
        switch self {
        case .Header(let header): return header
        case .Text(let text): return text
        case .Integer(let integer):return integer
        case .Decimal(let decimal):return decimal
        case .Date(let date): return date
        case Empty: return nil
        }
    }
    
    public var isHeader:Bool {
        switch self {
        case .Header(_): return true
        default: return false
        }
    }
}