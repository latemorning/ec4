package egovframework.com.cmm.util;

import java.util.Enumeration;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.MessageSource;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import egovframework.com.ext.jfile.view.JSonView;

/**
 * <pre>
 * SimpleMappingExceptionResolver
 * ajax 호출시 재정의
 * </pre>
 *
 * @author harry
 * @since 2018.05.30
 *
 */
public class EgovSimpleMappingExceptionResolver extends SimpleMappingExceptionResolver {

    private MessageSource messageSource;
    private String defaultErrorMessageKey;
    private Properties ajaxExceptionMappings;


    /**
     * @param messageSource
     */
    public void setMessageSource(MessageSource messageSource) {

        this.messageSource = messageSource;
    }


    /**
     * ajax 호출시 ErrorMessageKey가 매핑되지 않을경우 기본값
     *
     * @param defaultErrorMessageKey
     */
    public void setDefaultErrorMessageKey(String defaultErrorMessageKey) {

        this.defaultErrorMessageKey = defaultErrorMessageKey;
    }


    /**
     * ajax 호출시 ErrorMessageKey 매핑
     *
     * @param mappings
     */
    public void setAjaxExceptionMappings(Properties mappings) {

        this.ajaxExceptionMappings = mappings;
    }


    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {

        logger.info("CustomSimpleMappingExceptionResolverRequest::" + request.getHeader("Accept"));
        logger.error("CustomSimpleMappingExceptionResolver: " + ex);

        String str = request.getHeader("Accept").toLowerCase();

        if (str.indexOf("json") > -1) {

            String viewName = determineViewName(ex, request);
            String messageKey = determineMessageKey(ex, request);
            Integer statusCode = determineStatusCode(request, viewName);

            if (statusCode != null) {

                applyStatusCodeIfPossible(request, response, statusCode);
            }

            // jsonView 로 강제 셋팅. harry
            viewName = JSonView.NAME;

            ModelAndView mv = new ModelAndView(viewName);
            mv.addObject("errorMessage", messageSource.getMessage(messageKey, null, Locale.getDefault()) + "("+ex.getMessage()+")");

            return mv;
        } else {

            return super.doResolveException(request, response, handler, ex);
        }
    }


    /**
     * Exception과 매핑된 messageKey 반환
     *
     * @author harry
     * @param ex
     * @param request
     * @return
     */
    protected String determineMessageKey(Exception ex, HttpServletRequest request) {

        String messageKey = null;

        if (this.ajaxExceptionMappings != null) {

            messageKey = findMatchingMessageKey(this.ajaxExceptionMappings, ex);
        }

        if (messageKey == null && this.defaultErrorMessageKey != null) {

            if (logger.isDebugEnabled()) {

                logger.debug("Resolving to default messageKey '" + this.defaultErrorMessageKey + "' for exception of type [" + ex.getClass().getName() + "]");
            }

            messageKey = this.defaultErrorMessageKey;
        }

        return messageKey;
    }


    /**
     * Exception과 매핑된 messageKey 반환
     *
     * @author harry
     * @param ajaxExceptionMappings
     * @param ex
     * @return
     */
    protected String findMatchingMessageKey(Properties ajaxExceptionMappings, Exception ex) {

        String messageKey = null;
        String dominantMapping = null;

        int deepest = Integer.MAX_VALUE;

        for (Enumeration<?> names = ajaxExceptionMappings.propertyNames(); names.hasMoreElements();) {

            String exceptionMapping = (String)names.nextElement();
            int depth = getDepth(exceptionMapping, ex);

            if (depth >= 0 && (depth < deepest || (depth == deepest && dominantMapping != null && exceptionMapping.length() > dominantMapping.length()))) {

                deepest = depth;
                dominantMapping = exceptionMapping;
                messageKey = ajaxExceptionMappings.getProperty(exceptionMapping);
            }
        }

        if (messageKey != null && logger.isDebugEnabled()) {

            logger.debug("Resolving to messageKey '" + messageKey + "' for exception of type [" + ex.getClass().getName() + "], based on exception mapping ["
                    + dominantMapping + "]");
        }

        return messageKey;
    }

}
