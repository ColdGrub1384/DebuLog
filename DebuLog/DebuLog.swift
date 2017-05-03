//
//  DebuLog.swift
//  DebuLog
//
//  Created by Adrian on 23.04.17.
//  Copyright © 2017 Adrian. All rights reserved.
//

import Foundation

public class DebuLog {
     public var file: URL?
    
     public enum errors: Error {
        case errorWritingFile
        case errorWritingToFile
    }
    
    public func close() {
        do {try FileManager.default.removeItem(at: file!)} catch _ {}
    }
    
    public init() {
        print("DebuLog instantiated!")
    }
    
    public func debug (_ thing:Any..., terminator:String) throws {
        print(thing, terminator: terminator)
        
        if file != nil {
            if !FileManager.default.fileExists(atPath: (file?.path)!) {
                FileManager.default.createFile(atPath: (file?.path)!, contents: nil, attributes: [:])
                
                if !FileManager.default.fileExists(atPath: (file?.path)!) {
                    throw errors.errorWritingFile
                }
            }
            do {
                let filehandle = try FileHandle(forWritingTo: file!)
                filehandle.seekToEndOfFile()
                
                filehandle.write("\n\(thing)".data(using: .utf8)!)
                filehandle.closeFile()
            } catch _ {
                throw errors.errorWritingToFile
            }
        }
    }
    
     public func debug (_ thing:Any) throws {
        print(thing)
        
        if file != nil {
            if !FileManager.default.fileExists(atPath: (file?.path)!) {
                FileManager.default.createFile(atPath: (file?.path)!, contents: nil, attributes: [:])
                
                if !FileManager.default.fileExists(atPath: (file?.path)!) {
                    throw errors.errorWritingFile
                }
            }
            
            do {
                let filehandle = try FileHandle(forWritingTo: file!)
                filehandle.seekToEndOfFile()
                
                filehandle.write("\n\(thing)".data(using: .utf8)!)
                filehandle.closeFile()
            } catch _ {
                throw errors.errorWritingToFile
            }
        }
    }
    
    
    public func debug_ (_ thing:Any..., terminator:String) {
        print(thing, terminator: terminator)
        
        if file != nil {
            if !FileManager.default.fileExists(atPath: (file?.path)!) {
                FileManager.default.createFile(atPath: (file?.path)!, contents: nil, attributes: [:])
            }
            
            do {
                let filehandle = try FileHandle(forWritingTo: file!)
                filehandle.seekToEndOfFile()
                
                filehandle.write("\n\(thing)".data(using: .utf8)!)
                filehandle.closeFile()
            } catch _ {}
        }
    }
    
    public func debug_ (_ thing:Any) {
        print(thing)
        
        if file != nil {
            if !FileManager.default.fileExists(atPath: (file?.path)!) {
                FileManager.default.createFile(atPath: (file?.path)!, contents: nil, attributes: [:])
            }
            
            do {
                let filehandle = try FileHandle(forWritingTo: file!)
                filehandle.seekToEndOfFile()
                
                filehandle.write("\n\(thing)".data(using: .utf8)!)
                filehandle.closeFile()
            } catch _ {}
        }
    }
}
