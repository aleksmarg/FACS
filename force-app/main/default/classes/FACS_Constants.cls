/**
 * @description       : 
 * @author            : A.Margovskiy
 * @group             : 
 * @last modified on  : 03-14-2-23
 * @last modified by  : A.Margovskiy 
 * Modifications Log
 * Ver   Date         Author        Modification
 * 1.0 03-14-2-23   A.Margovskiy  Initial Versio
**/
public with sharing class FACS_Constants { 

    public static final String BRM_APP_NAME = 'FACS_Stewardship_Actual_Tracker'; 
public static final String S3_DATETIME_UTC_FORMAT = 'EEE, dd MMM yyyy HH:mm:ss z';
    public static final String S3_DIR_CONFIG = 'westcoast-foxtech-p2p-integration-qa/facs/outbound/affiliate_log/';
    public static final String S3_NAMED_CREDENTIAL = 'FACS_S3';

    public static final String HTTPHEADER_CONTENT_ENCODING = 'Content-Encoding';
    public static final String HTTPHEADER_VALUE_UTF8 = 'UTF-8';
    public static final String HTTPHEADER_CONTENT_TYPE = 'Content-type';
    public static final String HTTPHEADER_VALUE_TEXT_PLAIN = 'text/plain';
    public static final String HTTPHEADER_VALUE_BINARY_OCTET_STREAM = 'binary/octet-stream';
    public static final String HTTPHEADER_CONNECTION = 'Connection';
    public static final String HTTPHEADER_CONNECTION_KEEPALIVE = 'Connection';
    public static final String HTTPHEADER_DATE = 'Date';
    public static final String HTTPHEADER_ACL = 'ACL';
    public static final String HTTPHEADER_ACL_PUBLIC_READ = 'ACL';
    public static final String HTTP_PUT = 'PUT';
 public static final String GENERIC_ERROR_MSG = 'Internal error occured. Please contact your administrator';
}