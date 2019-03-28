package egovframework.rte.psl.dataaccess.util;

public final class UnderscoreUtil {

    private UnderscoreUtil() {

    }


    /**
     * <pre>
     * camel 스타일의 데이터 클래스 멤버변수명 또는
     * 화면오브젝트명을 DB컬럼명 스타일로 변환
     * FROM camel or pascal style TO db style using underscore
     * userName or UserName => USER_NAME
     * </pre>
     *
     * @param str
     * @return value
     */
    public static String convert2Underscore(String str) {

        String regex = "([a-z])([A-Z])";

        String replacement = "$1_$2";

        String value = "";

        value = str.replaceAll(regex, replacement).toUpperCase();

        return value;
    }

}
