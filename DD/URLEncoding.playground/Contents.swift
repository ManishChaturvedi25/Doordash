//: Playground - noun: a place where people can play

import Foundation

extension String {
    
    // Take reserve characters and percent encode it
    func addingPercentEncoding() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
}


var test = "%&"
test.addingPercentEncoding()

func encodeParametersInUrl(_ parameters:[String: Any])->String {
    
    var components = [(String, String)]()
    let sortedKeys = parameters.keys.sorted(by: {$0 < $1})
    for key in sortedKeys {
        let value = parameters[key]
        let queryComponents = queryComponentsWith(key: key, value: value)
        
        components.append(contentsOf: queryComponents)
    }
    
    let encodedComponents = components.map{"\($0)=\($1)"}
    return encodedComponents.joined(separator: "&")
    
}

func queryComponentsWith(key:String, value:Any)->[(String, String)] {
    
    var components = [(String, String)]()
    
    if let dictionary = value as? [String: Any] {
        for (nestedKey,value) in dictionary {
            // recursively call the queryComponentsWith() until we reach [String, String]
           let nestedComponent = queryComponentsWith(key: "\(key)[\(nestedKey)]", value: value)
            
                components.append(contentsOf: nestedComponent)
            }
        
        }else if let array = value as? [Any] {
            for vlaue in array {
                let nestedComponent = queryComponentsWith(key: "\(key)[]", value: value)
                
                components.append(contentsOf: nestedComponent)
            }
    }else {
        let encodedeKey = key.addingPercentEncoding()
        let encodedValue = "\(value)".addingPercentEncoding()
        let component = (encodedeKey,encodedValue)
        components.append(component)
        
    }
        
return components
}


// Test

let params = ["Foo": true]

encodeParametersInUrl(params)


































