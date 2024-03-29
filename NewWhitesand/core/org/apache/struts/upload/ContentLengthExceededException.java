/*
 * $Id: ContentLengthExceededException.java 54929 2004-10-16 16:38:42Z germuska $ 
 *
 * Copyright 1999-2004 The Apache Software Foundation.
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
 */


package org.apache.struts.upload;

import java.io.IOException;

/**
 * This exception is thrown when multipart post data exceeds the value
 * given by the Content-Length header
 *
 * @deprecated Use the Commons FileUpload based multipart handler instead. This
 *             class will be removed after Struts 1.2.
 */
public class ContentLengthExceededException extends IOException {
    
    protected String message;
    
    public ContentLengthExceededException() {
        message = "The Content-Length has been exceeded for this request";
    }
    
    public ContentLengthExceededException(long contentLength) {
    
        message = "The Content-Length of " + contentLength + " bytes has been " +
            "exceeded";
    }
    
    public String getMessage() {
        return message;
    }
}