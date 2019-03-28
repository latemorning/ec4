package egovframework.ec4.cmm.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.validation.ObjectError;

import com.google.gson.Gson;

/**
 * @Class Name : ResponseWrapperVO.java
 * @Description : ajax 사용시 리턴 값
 * @author harry
 * @Modification Information
 *
 *               <pre>
 *
 *   수정일        수정자             수정내용
 *  ----------    --------    ---------------------------
 *  2018.05.04    harry       최초 생성
 *               </pre>
 *
 * @author wizvil harry
 * @since 2018.05.04
 * @version 1.0
 * @see
 */
public final class ResponseWrapperVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private boolean isSuccess = false;

    private String message = "";

    private List<String> errorMessages = null;

    private List<ObjectError> errors = null;


    public boolean isSuccess() {

        return isSuccess;
    }


    public void setSuccess(boolean isSuccess) {

        this.isSuccess = isSuccess;
    }


    public String getMessage() {

        return message;
    }


    public void setMessage(String message) {

        this.message = message;
    }


    public List<ObjectError> getErrors() {

        return errors;
    }


    public void setErrors(List<ObjectError> errors) {

        this.errors = errors;
    }


    public List<String> getErrorMessages() {

        return errorMessages;
    }


    public void setErrorMessages(List<String> errorMessages) {

        this.errorMessages = errorMessages;
    }


    public String toJson() {

        Gson gson = new Gson();
        //json string으로 parsing
        return gson.toJson(this);
    }

}
