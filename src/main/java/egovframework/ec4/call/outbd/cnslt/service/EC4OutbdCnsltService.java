package egovframework.ec4.call.outbd.cnslt.service;

/**
 * 아웃바운드 상담
 *
 * @author harry
 * @since 2018.07.25
 */
public interface EC4OutbdCnsltService {

    /**
     * 해피콜 처리 이력 상담결과 등록
     *
     * @param outbdCnsltVO
     * @throws Exception
     */
    void insertCnsltResult(OutbdCnsltVO outbdCnsltVO) throws Exception;

}
