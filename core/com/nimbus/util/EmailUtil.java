package com.nimbus.util;

import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

public class EmailUtil {
  /**
   * send email in HTML format
   */
  public static void sendEmail(String to, String title, String content)
      throws Exception {
    // server address
    String smtp_host = Configuration.getInstance().getValue("mail.smtphost");
    // user 
    String user = Configuration.getInstance().getValue("mail.from");
    // password
    String password = Configuration.getInstance().getValue("mail.password");

    //
    Properties props = new Properties();
    props.put("mail.smtp.host", smtp_host);
    props.put("mail.smtp.auth", "true");
    Session ssn = Session.getInstance(props, null);

    MimeMessage message = new MimeMessage(ssn);

    InternetAddress fromAddress = new InternetAddress(user);
    message.setFrom(fromAddress);
    InternetAddress toAddress = new InternetAddress(to);
    message.addRecipient(Message.RecipientType.TO, toAddress);
    message.setSubject(MimeUtility.encodeText(title, "UTF-8", "B"));

    Multipart mainPart = new MimeMultipart();
    BodyPart html = new MimeBodyPart();
    html.setContent(content, "text/html; charset=UTF-8");
    mainPart.addBodyPart(html);
    message.setContent(mainPart);

    // message.setText(content);

    Transport transport = ssn.getTransport("smtp");
    transport.connect(smtp_host, user, password);
    transport.sendMessage(message,
                          message.getRecipients(Message.RecipientType.TO));
    transport.close();
  }

  public static void main(String[] args) {
    try {
      sendEmail("461424348@qq.com", "test", "bbbb");
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
}
