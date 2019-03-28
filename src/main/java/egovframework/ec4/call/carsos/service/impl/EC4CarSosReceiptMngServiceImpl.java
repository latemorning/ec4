package egovframework.ec4.call.carsos.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.call.carsos.service.EC4CarSosReceiptMngService;
import egovframework.ec4.call.carsos.service.CarSosReceiptMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 긴급출동에 관한 ServiceImpl 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

@Service("carSosReceiptMngService")
public class EC4CarSosReceiptMngServiceImpl extends EgovAbstractServiceImpl implements EC4CarSosReceiptMngService {

	@Resource(name="carSosReceiptMngDAO")
    private CarSosReceiptMngDAO carSosReceiptMngDAO;


    /**
	 * 목록을 조회한다.
	 * @param carSosReceiptMngVO carSosReceiptMngVO
	 * @return List<carSosReceiptMngVO>
	 * @exception Exception
	 */
    public List<CarSosReceiptMngVO> selectCarSosReceiptMng(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {
        return carSosReceiptMngDAO.selectCarSosReceiptMng(carSosReceiptMngVO);
    }



    /*
     * 긴급출동접수 등록 (상담내용 + 유형 + 불만)
     */
    @Override
    public void insertCarSosReceiptReg(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {

    	carSosReceiptMngDAO.insertCarSosReceiptReg(carSosReceiptMngVO);
    	
    }



    /*
     * 긴급출동접수 등록 (상담내용 + 유형 + 불만)
     */
    @Override
    public void updateCarSosReceiptReg(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {

    	carSosReceiptMngDAO.updateCarSosReceiptReg(carSosReceiptMngVO);
    	
    }


    /*
     * 긴급출동접수 목록
     */
    @Override
    public ArrayList<EgovMap> selectCarSosReceiptHistList(CarSosReceiptMngVO searchVO) throws Exception {
    	return carSosReceiptMngDAO.selectCarSosReceiptHistList(searchVO);
    }


    /*
     * 긴급출동접수 목록 카운트
     */
    @Override
    public int selectCarSosReceiptHistListCnt(CarSosReceiptMngVO searchVO) throws Exception {
    	return carSosReceiptMngDAO.selectCarSosReceiptHistListCnt(searchVO);
    }

    /*
     * 상담내용 매니저처리
     */
    @Override
    public EgovMap selectCarSosReceiptModLoad(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {
    	return carSosReceiptMngDAO.selectCarSosReceiptModLoad(carSosReceiptMngVO);
    }


}
