package egovframework.com.cmm;

/*
 * Copyright 2002-2005 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 * 		수정일         수정자                   수정내용
 *   -------    --------    ---------------------------
 *   2017-02-08    이정은        시큐어코딩(ES) - 시큐어코딩 부적절한 예외 처리[CWE-253, CWE-440, CWE-754]
 * 
 */


import java.util.logging.Logger;

import java.io.BufferedReader; 
import java.io.IOException; 
import java.io.InputStreamReader; 
import java.net.URL; 

/**
 * URL 주소 단축
 * @author 최재중
 * @since 2019.02.26
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.02.26  최재중          최초 생성
 *
 * </pre>
 */




public class UrlShortener {

    public static final Logger log = Logger.getLogger(UrlShortener.class.getSimpleName());
    
    private static final String tinyUrl = "http://tinyurl.com/api-create.php?url=";


    
 	//구글 url Shortener는 2019년4월 서비스 종료한다기에 아래 함수를 사용한다.
	public static String shorter(String url) throws IOException {
		String tinyUrlLookup = tinyUrl + url;
		BufferedReader reader = new BufferedReader(new InputStreamReader(new URL(tinyUrlLookup).openStream()));
		String tinyUrl = reader.readLine();
		return tinyUrl;
	}
    
    
}