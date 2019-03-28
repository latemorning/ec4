package egovframework.ec4.cmm.cmfile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.ec4.cmm.cmfile.service.EC4FileMngService;
import egovframework.ec4.cmm.service.PopupTestDefaultVO;
import egovframework.ec4.cmm.cmfile.service.FileMngVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

/**
 * 파일전송에 관한 ServiceImpl 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.23
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.23  최재중          최초 생성
 *
 * </pre>
 */

@Service("fileMngService")
public class EC4FileMngServiceImpl extends EgovAbstractServiceImpl implements EC4FileMngService {

	@Resource(name="fileMngDAO")
    private FileMngDAO fileMngDAO;

    /** ID Generation */
    @Resource(name = "ec4CallCustIdGnrService")
    private EgovIdGnrService callCustIdGnrService;
    
    
    
    




}
