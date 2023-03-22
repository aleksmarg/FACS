/**
 * @description       : String constants used by the CORE package
 * @author            : Ralph Gabuat
 * @group             :
 * @last modified on  : 02-16-2023
 * @last modified by  : Ralph Gabuat
 * Modifications Log
 * Ver   Date         Author         Modification
 * 1.0   09-24-2020   Ralph Gabuat   Initial Version
 **/
public with sharing class CORE_Constants {
    public static final String NOTIFICATION_DEFAULT_BANNER = '<table cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt"> <tbody> <tr> <td style="padding: 0px; border-collapse: collapse; padding: 30px 10px; text-align:center;"> <table id="header-pattern" cellspacing="0" cellpadding="0" border="0" style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; max-width: 600px; background-color: white; border-collapse: collapse; padding: 40px 30px; border-radius: 10px;margin: 0 auto;"> <tbody> <tr> <td> <p class="bansBanner"><img src="data:image/jpeg;base64,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9WsLCG1mivL5ESZ/Ot0lIYJ8vBfHHpXoXhX9ji/8L6xa6x8W/FfhXwR4LsZY7m9li123vry6jVgfKt4YGcs7Yxz0yTg9K8x/aI+KyfG741+LPG0NrJZWWp3IFnbS4DxW0aLHEGx0bYgJHYnFaQlzVPdd0Z1I8tH34pP8T6E/ZFbwl8b/AIbnwJ8Qp5EtfhlqDeONPm2lzLpi/NfWXXhS4jbH+37V8y/F74naj8aPid4k8b6oWW61m7a4SFjnyIfuwwj2SMKv4V67+xTdW9nq/wAXzc3MFssnw41eNDPKse9z5WFXcRlj2A5r5wh/1Kf7o/lRTilVk1/VxVajlRiv60HUUUV0nAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAoJBBBwR0NX5tf1a5jeKbV9QnicYeOW8kdWHoQWwfxrPopDUmtgpHRZFw6hh6EZpaKYA487b5haXb93zGLbfpnpV631zU7OFYbbU762hXO2KG6kRBnrhQQKo0Uh8z7ktxPLeSvLcSyXEznLyTOXZvck8mra+INWTaF1jUlC8DF7KMY/4FWfRRZBzNbMUnOSTk0lFFMk0JNWkk0OLTCieVHcNcB+dxLKq464x8tZ9FFRGKj8KN6tapXadR3skl6JWS+SCiiirMA8tRIXCjeRgtjnFFFFAyN7OCRizQxsx5LMgJNItlbqwIgiBHIIQZqWigfNLuFRfZYN27yY93rtGalooEm1sFII1V2cKoduC2OTS0UALSIixKFRQqjoAMCiigQiRpHkKoUE5OBjJp3t2pKKBiJGsahUUIo6KowBQ8ayDDqGX0YZpaKAu9xkdvFC2Y4kQ+qqBUmfekooBtvchNjbdfs8Wf9wU6O1giYMkMaN2ZUANSUUD5pdwYBhgjI9DUa2sEbblhjVvUKBUlFArtBSMquuGAYehGaWigRHHbRQtlIo0PqqgVJRRQNtvcR41kxuVWwcjIzg+tLRRQAUUUUCCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k="></img></p><p></p>';
    public static final String NOTIFICATION_DEFAULT_FOOTER = '<p class="bansFooter"><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD/4QBoRXhpZgAATU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAAExAAIAAAARAAAATgAAAAAAAABgAAAAAQAAAGAAAAABcGFpbnQubmV0IDQuMi4xMwAA/+EDqmh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4NCjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4NCiAgPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4NCiAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjE1MjM5ZjRhLTM0YzMtNDA1Zi1hOGFiLTEyOTRmM2Q4MmY4YyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDpERjRGQ0VBNzMyMUYxMUU5OTMwNUQ2QkYzODBEREQyMCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDpERjRGQ0VBNjMyMUYxMUU5OTMwNUQ2QkYzODBEREQyMCIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOSAoTWFjaW50b3NoKSI+DQogICAgICA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo4OTI3ZGRiNC03NmZhLTRjOTktYTc1Mi1jNGY0NjZlMDBiY2IiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo3M2ViYjFlNi1mNzcxLTNmNDAtYjI4Yy1mZTJlOGNjZDVjZGIiIC8+DQogICAgPC9yZGY6RGVzY3JpcHRpb24+DQogIDwvcmRmOlJERj4NCjwveDp4bXBtZXRhPg0KPD94cGFja2V0IGVuZD0iciI/Pv/bAEMAAgEBAQEBAgEBAQICAgICBAMCAgICBQQEAwQGBQYGBgUGBgYHCQgGBwkHBgYICwgJCgoKCgoGCAsMCwoMCQoKCv/bAEMBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIAAoCvAMBIQACEQEDEQH/xAAfAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgv/xAC1EAACAQMDAgQDBQUEBAAAAX0BAgMABBEFEiExQQYTUWEHInEUMoGRoQgjQrHBFVLR8CQzYnKCCQoWFxgZGiUmJygpKjQ1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4eLj5OXm5+jp6vHy8/T19vf4+fr/xAAfAQADAQEBAQEBAQEBAAAAAAAAAQIDBAUGBwgJCgv/xAC1EQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APxzor9IPysKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooAKKACigAooA//Z"/></p> </td> </tr> <tr> <td padding: 20px;> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>';
    public static final String NOTIFICATION_DEFAULT_MARGIN_PRE = '<table border=0 cellpadding=0 cellspacing=0 style="border-collapse: collapse; mso-table-lspace: 0pt; mso-table-rspace: 0pt; max-width: 660px; width: 660px; margin: 0 40px 0 0; font-family: Arial; font-size: 14px; text-align: justify;"><tbody><tr><td><div style="font-family:Arial;font-size:14px;text-align:justify;width:620px;margin-left:40px">';
    public static final String NOTIFICATION_DEFAULT_MARGIN_POST = '</div></td></tr></tbody></table>';
    public static final String NOTIFICATION_INACTIVE_USER_TEMPLATE = 'CORE_INACTIVE_USER_NOTIF_TEMPLATE';
    public static final String FOX_SMTP_RESPONSE_MESSAGE_KEY = 'message';
    public static final String FOX_SMTP_RESPONSE_MESSAGE_SUCCESS_VALUE = 'success';
    public static final String HTTP_POST = 'POST';
    public static final String HTTP_GET = 'GET';
    public static final String HTTP_PATCH = 'PATCH';
    public static final String API_CONTENT_TYPE_URLENCODED = 'application/x-www-form-urlencoded';
    public static final String API_CONTENT_TYPE_JSON_CHARSET_UTF8 = 'application/json;charset=utf-8';

    public static final String NAMED_CREDENTIAL_CORE_TOKEN = 'CORE_API_Token';
    public static final String NAMED_CREDENTIAL_SMTP_TOKEN = 'CORE_Okta_SMTP_Token';
    public static final String NAMED_CREDENTIAL_SMTP_API = 'CORE_SMTP_API';
    public static final String NAMED_CREDENTIAL_MOVEWORKS_API = 'CORE_Moveworks_API';
    public static final String NAMED_CREDENTIAL_OKTA_API = 'CORE_OKTA_API';
    public static final String NAMED_CREDENTIAL_OKTA_API_WRITE = 'CORE_OKTA_API_WRITE';
    public static final String NAMED_CREDENTIAL_SNOW_API = 'CORE_SNOW_API';
    public static final String NAMED_CREDENTIAL_SLACK_API = 'CORE_Slack_API';
    public static final String OKTA_WRITE_API_KEY_SETTING = 'CORE_OktaAPITokenGroupWrite';
    public static final String OKTA_READ_API_KEY_SETTING = 'CORE_OktaAPITokenReadOnly';
    public static final String SLACK_BOT_TOKEN = 'CORE_SlackBotToken';
    public static final String SLACK_VERIFICATION_TOKEN = 'CORE_SlackVerificationToken';
    public static final String HTTP_RESPONSE_LINK_HEADER = 'Link';
    public static final String HTTP_RESPONSE_NEXT_LINK_VALUE = 'rel="next"';

    public static final String EMAILSERVICE_DUMMYCONTACTEMAIL = 'CORE_For_Email_Contact_DO_NOT_DELETE@fxpmocore.com';
    public static final String OKTA_REFRESH_RECIPIENTS = 'OktaRefreshNotifRecipients';
    public static final String INACTIVE_USER_ALERT_RECIPIENTS = 'InactiveUserAlertRecipients';
    public static final String INACTIVE_USER_ALERT_APP_OWNER = 'InactiveUserAppOwner';
    public static final String INACTIVE_USER_ALERT_MIN_DAYS = 'InactiveUserAlertMinDays';
    public static final String INACTIVE_USER_ALERT_MAX_DAYS = 'InactiveUserAlertMaxDays';
    public static final String INACTIVE_USER_ALERT_SEND_TO_BUSINESS = 'InactiveUserBusinessUsers';
    public static final String BANS_EMAIL_RECIPIENTS_BATCH_SIZE = 'BANSEmailRecipientsBatchSize';

    public static final String APP_DEV_NAME_BANS = 'CORE_Business_App_Notification_System';
    public static final String APP_DEV_NAME_FOX_APPS = 'CORE_Fox_Package_Management';

    public static final String CORE_ISSUE_IMPACT_HIGH = '1 - High';
    public static final String CORE_ISSUE_IMPACT_MEDIUM = '2 - Medium';
    public static final String CORE_ISSUE_IMPACT_LOW = '3 - Low';
    public static final String EMAIL_TEMPLATE_CORE_ISSUE_SUBMITTED = 'CORE Issue Submitted';

    public static final String CORE_EXCEPTIONLOG_INSERT_EVENT = 'CORE_ExceptionLog_INSERT';
    public static final String CORE_EXCEPTIONLOG_PROCESS_EVENT = 'CORE_ExceptionLog_PROCESS';

    public static final String CORE_TOKEN_CACHE_PARTITION_NAME = 'COREOktaToken';

    public enum CORE_Issue_Impact {
        HIGH,
        MEDIUM,
        LOW
    }

    public enum CORE_SNOW_State {
        INPROGRESS,
        ONHOLD,
        RESOLVED,
        CANCELLED
    }

    public static final String CORE_SNOW_STATE_INPROG = 'In Progress';
    public static final String CORE_SNOW_STATE_ONHOLD = 'On Hold';
    public static final String CORE_SNOW_STATE_RESOLVED = 'Resolved';
    public static final String CORE_SNOW_STATE_CANCELLED = 'Cancelled';

    public enum CORE_SNOW_RESOLUTION_CODE {
        CLOSED_RESOLVED_BY_CALLER,
        DUPLICATE_TICKET,
        NOT_SOLVED_NOT_REPRODUCIBLE,
        NOT_SOLVED_TOO_COSTLY,
        SOLVED_PERMANENTLY,
        SOLVED_WORK_AROUND,
        SOLVED_REMOTELY_PERMANENTLY,
        SOLVED_REMOTELY_WORK_AROUND,
        TRANSFERRED_TO_DISNEY
    }

    public static final String CORE_SNOW_RESCODE_CLOSED_RESOLVED_BY_CALLER = 'Closed/Resolved by Caller';
    public static final String CORE_SNOW_RESCODE_DUPLICATE_TICKET = 'Duplicate Ticket';
    public static final String CORE_SNOW_RESCODE_NOT_SOLVED_NOT_REPRODUCIBLE = 'Not Solved (Not Reproducible)';
    public static final String CORE_SNOW_RESCODE_NOT_SOLVED_TOO_COSTLY = 'Not Solved (Too Costly)';
    public static final String CORE_SNOW_RESCODE_SOLVED_PERMANENTLY = 'Solved (Permanently)';
    public static final String CORE_SNOW_RESCODE_SOLVED_WORK_AROUND = 'Solved (Work Around)';
    public static final String CORE_SNOW_RESCODE_SOLVED_REMOTELY_PERMANENTLY = 'Solved Remotely (Permanently)';
    public static final String CORE_SNOW_RESCODE_SOLVED_REMOTELY_WORK_AROUND = 'Solved Remotely (Work Around)';
    public static final String CORE_SNOW_RESCODE_TRANSFERRED_TO_DISNEY = 'Transferred to Disney';

    public static final String SLACK_ERROR_TOKEN_MISSING = 'Slack token required.';
    public static final String SLACK_USERID_MISSING = 'Slack user IDs required.';
    public static final String SLACK_CHANNEL_MISSING = 'Slack channel required.';
    public static final String SLACK_EMAIL_MISSING = 'Email required.';
    public static final String SLACK_LOOKUPBYEMAIL_PATH = '/users.lookupByEmail?email={0}';
    public static final String SLACK_OPENCONVERSATIONS_PATH = '/conversations.open';
    public static final String SLACK_POSTMESSAGE_PATH = '/chat.postMessage';

    //Mapping
    public static final String MAPPING_FULL_INFO_SOURCE_IDENTIFIER = 'Map_Full_Information';

    public static final String NAMED_CREDENTIAL_SENDGRID = 'CORE_SendGrid_Email_Send';
    public static final String SENDGRID_APIKEY_NAME = 'CORE_SendGrid_APIKey';

    public enum CORE_EMAIL_PRIORITY {
        HIGHEST,
        HIGH,
        NORMAL,
        LOW,
        LOWEST
    }
}