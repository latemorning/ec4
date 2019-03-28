package egovframework.ec4.call.carsos.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.ec4.call.carsos.service.CarSosReceiptMngVO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 긴급출동에 대한 DAO 클래스를 정의한다.
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

@Repository("carSosReceiptMngDAO")
public class CarSosReceiptMngDAO extends EgovComAbstractDAO {



    /**
	 * 목록을 조회한다.
	 * @param carSosReceiptMngVO carSosReceiptMngVO
	 * @return List<carSosReceiptMngVO>
	 * @exception Exception
	 */
    @SuppressWarnings("unchecked")
	public List<CarSosReceiptMngVO> selectCarSosReceiptMng(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {
        return (List<CarSosReceiptMngVO>) list("carSosReceiptMngDAO.selectCarSosReceiptMng", carSosReceiptMngVO);
    }




    /**
     * 긴급출동접수 등록
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void insertCarSosReceiptReg(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {

        insert("carSosReceiptMngDAO.insertCarSosReceiptReg", carSosReceiptMngVO);
    }



    /**
     * 긴급출동접수 수정
     *
     * @param detailCodeVO
     * @throws Exception
     */
    public void updateCarSosReceiptReg(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {

        update("carSosReceiptMngDAO.updateCarSosReceiptReg", carSosReceiptMngVO);
    }


    /**
     * 긴급출동접수 목록
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
    public ArrayList<EgovMap> selectCarSosReceiptHistList(CarSosReceiptMngVO searchVO) throws Exception {

        return (ArrayList<EgovMap>)list("carSosReceiptMngDAO.selectCarSosReceiptHistList", searchVO);
    }


    /**
     * 긴급출동접수 목록 카운트
     *
     * @param searchVO
     * @return
     * @throws Exception
     */
    public int selectCarSosReceiptHistListCnt(CarSosReceiptMngVO searchVO) throws Exception {

        return (int)select("carSosReceiptMngDAO.selectCarSosReceiptHistListCnt", searchVO);
    }


    /**
     * 긴급출동접수 수정load
     *
     * @param cnsltInBoundMngVO
     * @return
     * @throws Exception
     */
    public EgovMap selectCarSosReceiptModLoad(CarSosReceiptMngVO carSosReceiptMngVO) throws Exception {

        return (EgovMap)select("carSosReceiptMngDAO.selectCarSosReceiptModLoad", carSosReceiptMngVO);
    }

}
