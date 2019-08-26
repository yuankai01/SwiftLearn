//
//  CETCConsultDetailModel.swift
//  CETCXGHospital
//
//  Created by Gao on 2018/12/6.
//  Copyright © 2018 Aaron Yu. All rights reserved.
//

import UIKit

class CETCConsultDetailModel: CETCSwiftBaseModel {
    @objc var meetSubject = ""      // 会诊主题
    @objc var senderFlag = ""       //是否是发起人
    @objc var pexipId = ""          //
    @objc var meetApproveStatus = ""       //状态1：会诊中；2：待会诊；3：已结束;4已拒绝
    @objc var patientName = ""      // 患者姓名
    
    @objc var applyTime = ""      //申请时间
    @objc var meetTime = ""       //会诊时间
    @objc var meetNo = ""          //会诊号
    @objc var managePasswd = ""       //会诊室管理员密码
    @objc var invitationPasswd = ""      //会议参与密码
    
    @objc var patientId = ""      //患者id
    //会诊介绍
    @objc var introModel = CETCConDetailIntroModel.init(dic: nil)
    
    @objc var countTotal = ""      //会诊总人数 关键字
    
    @objc var orgInfoModel = CETCConOrgInfoModel.init(dic: nil)   //发起/受邀机构Model
    @objc var auditList = NSMutableArray()      //审核进度列表
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
        if key == "auditList" {
            let muArray = NSMutableArray()
            let list = value as! NSArray
            for item in list {
                let model = CETCAuditListModel.init(dic: item as? [String : Any])
                muArray.add(model)
            }
            
            auditList = muArray
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "introduce" {
            introModel = CETCConDetailIntroModel.init(dic: value as? [String : Any])
        }
        
        //发起/受邀机构Model
        if key == "orgInfo" {
            orgInfoModel = CETCConOrgInfoModel.init(dic: value as? [String : Any])
        }
        
        //会诊列表和审核列表用的不是一个字段
        if key == "approveStatus" && self.meetApproveStatus.count == 0 {
            self.meetApproveStatus = value as! String
        }
        
        if key == "meetStatus" && self.meetApproveStatus.count == 0 {
            self.meetApproveStatus = value as! String
        }
    }
}

//会诊介绍Model
class CETCConDetailIntroModel: CETCSwiftBaseModel {
    @objc var illnessDesc = ""   //会诊介绍(病情描述)
    @objc var goal = ""         //会诊目的
    @objc var remark = ""      //备注
}

// MARK: - 发起和受邀专家Model ***************
class CETCConOrgInfoModel: CETCSwiftBaseModel {
    @objc var countNum = ""       //专家会诊总人数 关键字
    
    //不能直接添加Model 报错：__NSSingleObjectArrayI addObject: unrecognized selector sent 待分析。
    @objc var sendList = NSMutableArray()      //发起机构列表/可能多个机构
    @objc var receiveList = NSMutableArray()   //受邀机构列表/可能多个机构
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        //发起机构
        if key == "sendList" {
            let array = value as! NSArray
            let muArray = NSMutableArray()
            for item in array {
                let model = CETCConOrgInfoSubModel.init(dic: item as? [String : Any])
                muArray.add(model)
            }
            
            sendList = muArray;
        }
        
        //受邀机构
        if key == "receiveList" {
            let array = value as! NSArray
            let muArray = NSMutableArray()
            for item in array {
                let model = CETCConOrgInfoSubModel.init(dic: item as? [String : Any])
                muArray.add(model)
            }
            
            receiveList = muArray;
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "count" {
            countNum = value as! String
        }
    }
}

class CETCConOrgInfoSubModel: CETCSwiftBaseModel {
    @objc var orgName = ""        //机构名称
    @objc var officeList = NSMutableArray()      //科室列表
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
        if key == "officeList" {
            let array = value as! NSArray
            let muArray = NSMutableArray()
            for item in array {
                let model = CETCConOrgInfoSubDeepModel.init(dic: item as? [String : Any])
                muArray.add(model)
            }
            
            officeList = muArray
        }
    }
}

class CETCConOrgInfoSubDeepModel: CETCSwiftBaseModel {
    @objc var officeName = ""        //科室名称
    @objc var countNum = ""       //每个科室专家会诊人数 关键字
    @objc var officeId = ""      //科室id
    @objc var doctorList = NSMutableArray()      //医生列表
    @objc let doctorNames = NSMutableString()   //医生姓名组合
    
    override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
        
        if key == "doctorList" {
            let array = value as! NSArray
            let muArray = NSMutableArray()
            for item in array {
                
                let dic = item as! NSDictionary
                let doctorName = dic["doctorName"] as! String
                doctorNames.append(doctorName + " ")
                muArray.add(doctorName)
            }
            
            doctorList = muArray
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "count" {
            countNum = value as! String
        }
    }
}

// MARK: - 审核进度Model ***************
class CETCAuditListModel: CETCSwiftBaseModel {
    @objc var hospofficeName = ""      //审核进度（医院名称-科室名称）
    @objc var manName = ""       //姓名
    @objc var reviewState = ""       //描述
    @objc var remark = ""       //备注 科室
    @objc var dateTime = ""       //时间
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        if key == "description" {
            reviewState = value as! String
        }
    }
}
