package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * BootstrapPaginationRenderer.java 클래스
 *
 * @author harry
 * @since 2018. 04. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일          수정자           수정내용
 *  -------------    -------------    ----------------------
 *   2018. 04. 16.   harry            최초 생성
 * </pre>
 */
public class BootstrapPaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;

	public BootstrapPaginationRenderer() {

	}


	/*

    <button type="button" class="btn btn-default"><span class="fa fa-arrow-left"></span></button>
    <button type="button" class="btn btn-default">Previous</button>
    <button type="button" class="btn btn-default">1</button>
    <button type="button" class="btn btn-default">2</button>
    <button type="button" class="btn btn-default">3</button>
    <button type="button" class="btn btn-default">4</button>
    <button type="button" class="btn btn-default">5</button>
    <button type="button" class="btn btn-default">6</button>
    <button type="button" class="btn btn-default">Next</button>
    <button type="button" class="btn btn-default"><span class="fa fa-arrow-right"></span></button>


	*/

    public void initVariables(){
        firstPageLabel    = "<button type=\"button\" class=\"btn btn-default\"><span class=\"fa fa-arrow-left\"></span></button>";
        previousPageLabel = "<button type=\"button\" class=\"btn btn-default\">Previous</button>";
        currentPageLabel  = "<button type=\"button\" class=\"btn btn-default active\">{0}</button>";
        otherPageLabel    = "<button type=\"button\" class=\"btn btn-default\">{0}</button>";
        nextPageLabel     = "<button type=\"button\" class=\"btn btn-default\">Next</button>";;
        lastPageLabel     = "<button type=\"button\" class=\"btn btn-default\"><span class=\"fa fa-arrow-right\"></span></button>";
    }



/*
	public void initVariables(){
		firstPageLabel    = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/icon/icon_prevend.gif\" alt=\"처음\"   border=\"0\"/></a>&#160;";
        previousPageLabel = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/icon/icon_prev.gif\"    alt=\"이전\"   border=\"0\"/></a>&#160;";
        currentPageLabel  = "<strong>{0}</strong>&#160;";
        otherPageLabel    = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>&#160;";
        nextPageLabel     = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/icon/icon_next.gif\"    alt=\"다음\"   border=\"0\"/></a>&#160;";
        lastPageLabel     = "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \"><img src=\"" + servletContext.getContextPath() +  "/images/egovframework/com/cmm/icon/icon_nextend.gif\" alt=\"마지막\" border=\"0\"/></a>&#160;";
	}
*/


	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}
