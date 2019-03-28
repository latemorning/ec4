package egovframework.ec4.cmm.service;

import egovframework.com.cmm.service.EgovProperties;

/**
 * 클래스
 *
 * @author harry
 * @since 2018.08.20
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일        수정자       수정내용
 *  -------       --------    ---------------------------
 *   2018.08.20   harry       최초 생성
 *      </pre>
 */
public class GlobalEC4Variables {

    // 고객 수신동의 코드
    public static final String EC4_REPAGR_AGSMS = EgovProperties.getProperty("ec4.repagr.agsms");   // SMS
    public static final String EC4_REPAGR_AGMBT = EgovProperties.getProperty("ec4.repagr.agmbt");   // 모바일
    public static final String EC4_REPAGR_AGEML = EgovProperties.getProperty("ec4.repagr.ageml");   // email

    // 아웃바운드 상담결과 코드
    public static final String EC4_CLRSLT090 = EgovProperties.getProperty("ec4.clrslt090");   // 부재중
}
