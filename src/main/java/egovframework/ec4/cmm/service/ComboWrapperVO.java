package egovframework.ec4.cmm.service;

import java.io.Serializable;
import java.util.List;

import com.google.gson.Gson;

import egovframework.com.cmm.service.CmmnDetailCode;

/**
 * 콤보박스 반환 wrapper
 *
 * @author harry
 * @since 2018.05.17
 *
 */
public class ComboWrapperVO implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    /**
     * 다음과 같이 사용 권장...
     *
     * <pre>
     * results = [ {"id": "0", "text": "apple", "selected": true},
     *             {"id": "1", "text": "orange", "disabled": true},
     *             {"id": "2", "text": "banana"}
     *           ]
     * </pre>
     */
    private List<CmmnDetailCode> results = null;


    public List<CmmnDetailCode> getResults() {

        return results;
    }


    public void setResults(List<CmmnDetailCode> results) {

        this.results = results;
    }


    public String toJson() {

        Gson gson = new Gson();
        //json string으로 parsing
        return gson.toJson(this);
    }

}
