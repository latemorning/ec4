package egovframework.ec4.call.cnslt.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 상담원에 관한 서비스 인터페이스 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

public interface EC4CnsltDclzMngService {
    /**
	 * 목록을 조회한다.
	 * @param cnsltDclzMngVO cnsltDclzMngVO
	 * @return List<cnsltDclzMngVO>
	 * @exception Exception
	 */
	public List<CnsltDclzMngVO> selectCnsltDclzMng(CnsltDclzMngVO cnsltDclzMngVO) throws Exception;
	
	ArrayList<EgovMap> selectCnsltDclzRegList(CnsltDclzMngVO searchVO) throws Exception;
	
	int selectCnsltDclzRegListCnt(CnsltDclzMngVO searchVO) throws Exception;

    void insertCnsltDclz(CnsltDclzMngVO searchVO) throws Exception;
    
    EgovMap selectCnsltDclzMod(CnsltDclzMngVO cnsltDclzMngVO) throws Exception;

    void updateCnsltDclz(CnsltDclzMngVO searchVO) throws Exception;

    void deleteCnsltDclz(CnsltDclzMngVO searchVO) throws Exception;
	
}
