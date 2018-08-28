/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import entities.EntitiesEnum;

/**
 *
 * @author Ignatius
 */
public enum MessageEnum {
    COUNTRY("Country"), DEPARTMENT("Department"), EMPLOYEE("Employee"), JOB("Job"), LOCATION("Location"), REGION("Region"),
    SAVE_SUCCESS("Success to save data "), SAVE_FAILED("Failed to save data "),
    DROP_SUCCESS("Success to drop data "), DROP_FAILED("Failed to drop data "),
    DATA_NOT_FOUND("Data Not Found");
    
    private final String message;

    private MessageEnum(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
    
    public String getMessage(boolean isEmpty){
        if(isEmpty) return DATA_NOT_FOUND.getMessage();
        return "";
    }
    
    public String getMessage(MessageEnum messageEnum, boolean isDrop, boolean isTrue){
        String table = messageEnum.getMessage();
        if(!isDrop){
            if(isTrue) return SAVE_SUCCESS.getMessage()+table;
            else return SAVE_FAILED.getMessage()+table;
        }else{
            if(isTrue) return DROP_SUCCESS.getMessage()+table;
            else return DROP_FAILED.getMessage()+table;            
        }
    }
}
