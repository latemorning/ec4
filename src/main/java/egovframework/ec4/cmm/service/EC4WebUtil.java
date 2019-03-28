package egovframework.ec4.cmm.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.stereotype.Component;
import org.springframework.validation.ObjectError;

import egovframework.com.cmm.EgovMessageSource;

/**
 * ec4 web관련 유틸, spring server validation error 메시지 처리, 기타...
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일         수정자           수정내용
 *   ----------    	--------    ---------------------------
 *   2018.05.07     harry       최초생성
 * </pre>
 */
@Component("ec4WebUtil")
public class EC4WebUtil {

    /** EgovMessageSource */
    @Resource(name = "egovMessageSource")
    private EgovMessageSource egovMessageSource;


    public List<String> extractionErrorMessages(List<ObjectError> objectErrors) {

        ArrayList<String> errorMessages = new ArrayList<String>();

        if (objectErrors != null) {

            for (ObjectError error : objectErrors) {

                String defaultMessage = error.getDefaultMessage();

                Object[] arguments = error.getArguments();

                DefaultMessageSourceResolvable defaultMessageSourceResolvable = (DefaultMessageSourceResolvable)arguments[0];

                String[] fieldName = new String[1];
                fieldName[0] = egovMessageSource.getMessage(defaultMessageSourceResolvable.getDefaultMessage());

                String message = egovMessageSource.getReloadableResourceBundleMessageSource().getMessage(defaultMessage, fieldName, Locale.getDefault());

                errorMessages.add(StringUtils.defaultString(message));
            }
        }

        return errorMessages;
    }

}