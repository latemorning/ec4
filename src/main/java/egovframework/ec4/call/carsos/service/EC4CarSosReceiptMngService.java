package egovframework.ec4.call.carsos.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 긴급출동에 관한 서비스 인터페이스 클래스를 정의한다.
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

public interface EC4CarSosReceiptMngService {
    /**
	 * 목록을 조회한다.
	 * @param carSosReceiptMngVO carSosReceiptMngVO
	 * @return List<carSosReceiptMngVO>
	 * @exception Exception
	 */
	public List<CarSosReceiptMngVO> selectCarSosReceiptMng(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception;
	
	void insertCarSosReceiptReg(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception;
	
	void updateCarSosReceiptReg(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception;
	
	ArrayList<EgovMap> selectCarSosReceiptHistList(CarSosReceiptMngVO searchVO) throws Exception;
	
	int selectCarSosReceiptHistListCnt(CarSosReceiptMngVO searchVO) throws Exception;
	
	EgovMap selectCarSosReceiptModLoad(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception;
	
}
