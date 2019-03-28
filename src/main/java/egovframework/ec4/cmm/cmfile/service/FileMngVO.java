package egovframework.ec4.cmm.cmfile.service;

import java.util.List;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 파일전송에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.23
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.23  최재중          최초 생성
 *
 * </pre>
 */

public class FileMngVO extends EC4DefaultVO {

	private static final long serialVersionUID = 1L;

	List <FileMngVO> fileMngList;



    
    



	/**
	 * fileMngList attribute 를 리턴한다.
	 * @return List<FileMngVO>
	 */
	public List<FileMngVO> getFileMngList() {
		return fileMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param fileMngList List<FileMngVO>
	 */
	public void setFileMngList(List<FileMngVO> fileMngList) {
		this.fileMngList = fileMngList;
	}



}