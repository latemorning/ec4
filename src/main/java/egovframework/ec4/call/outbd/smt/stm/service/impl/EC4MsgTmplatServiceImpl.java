package egovframework.ec4.call.outbd.smt.stm.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.ec4.call.outbd.smt.stm.service.EC4MsgTmplatService;
import egovframework.ec4.call.outbd.smt.stm.service.MsgTmplatDefaultVO;
import egovframework.ec4.call.outbd.smt.stm.service.MsgTmplatVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("msgTmplatService")
public class EC4MsgTmplatServiceImpl extends EgovAbstractServiceImpl implements EC4MsgTmplatService {

    private static final Logger LOGGER = LoggerFactory.getLogger(EC4MsgTmplatServiceImpl.class);

    @Resource(name = "msgTmplatDAO")
    private MsgTmplatDAO msgTmplatDAO;

    /** ID Generation */
    @Resource(name = "ec4MsgTmplatIdGnrService")
    private EgovIdGnrService msgTmplatIdGnrService;


    @Override
    public ArrayList<EgovMap> selectMsgTmplatList(MsgTmplatDefaultVO searchVO) throws Exception {

        return msgTmplatDAO.selectMsgTmplatList(searchVO);
    }


    @Override
    public int selectMsgTmplatListCnt(MsgTmplatDefaultVO searchVO) throws Exception {

        return msgTmplatDAO.selectMsgTmplatListCnt(searchVO);
    }


    @Override
    public void asgnTmplat(MsgTmplatVO msgTmplatVO) throws Exception {

        // 기존 해제 후 등록

        msgTmplatDAO.relisTmplat(msgTmplatVO);
        msgTmplatDAO.asgnTmplat(msgTmplatVO);
    }


    @Override
    public void relisTmplat(MsgTmplatVO msgTmplatVO) throws Exception {

        msgTmplatDAO.relisTmplat(msgTmplatVO);
    }

}
