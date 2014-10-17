package cn.edu.fudan.function;

import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;
/**
 * ��������java��ʵ��Email�ķ��ͣ����õ���Э��Ϊ��SMTP���˿ں�Ϊ25��<br>
 * ��������Socket����ʵ�֣��򿪿ͻ��˵�Socket���������Ϸ�������<br>
 * �磺Socket sockClient = new Socket("smtp.qq.com",23);<br>
 * ���ʾ���������ӵ���QQ����ķ��������˿ں�Ϊ23
 * 
 */
public class mail
{
	/**
	 * ����MIME�ʼ�����
	 */
	private MimeMessage	mimeMsg;
	/**
	 * ר�����������ʼ���Session�Ự
	 */
	private Session		session;
	/**
	 * ��װ�ʼ�����ʱ��һЩ������Ϣ��һ�����Զ���
	 */
	private Properties	props;
	/**
	 * �����˵��û���
	 */
	private String		username;
	/**
	 * �����˵�����
	 */
	private String		password;
	/**
	 * ����ʵ�ָ�����ӵ����
	 */
	private Multipart	mp;
	/**
	 * ���Ͳ�����ʼ��,�еķ���������Ҫ�û���֤������������û�����������г�ʼ��""
	 * 
	 * @param smtp
	 *            SMTP�������ĵ�ַ������Ҫ��QQ���䣬��ôӦΪ��"smtp.qq.com"��163Ϊ��"smtp.163.com"
	 */
	public mail(String smtp)
	{
		username = "";
		password = "";
		// �����ʼ�������
		setSmtpHost(smtp);
		// �����ʼ�
		createMimeMessage();
	}
	/**
	 * ���÷����ʼ�������(JavaMail��ҪProperties������һ��session����
	 * ����Ѱ���ַ���"mail.smtp.host"������ֵ���Ƿ����ʼ�������);
	 * 
	 * @param hostName
	 */
	public void setSmtpHost(String hostName)
	{
//		System.out.println("����ϵͳ���ԣ�mail.smtp.host = " + hostName);
		if (props == null)
			props = System.getProperties();
		props.put("mail.smtp.host", hostName);
	}
	/**
	 * (���Session�����JavaMail �е�һ���ʼ�session. ÿһ������
	 * JavaMail��Ӧ�ó���������һ��session���ǿ�����������session�� �����������,
	 * Session������Ҫ֪�����������ʼ���SMTP ��������
	 */
	public boolean createMimeMessage()
	{
		try
		{
//			System.out.println("׼����ȡ�ʼ��Ự����");
			// ��props��������������ʼ��session����
			session = Session.getDefaultInstance(props, null);
		}
		catch (Exception e)
		{
//			System.err.println("��ȡ�ʼ��Ự����ʱ��������" + e);
			return false;
		}
	//	System.out.println("׼������MIME�ʼ�����");
		try
		{
			// ��session��������������ʼ���ʼ�����
			mimeMsg = new MimeMessage(session);
			// ���ɸ��������ʵ��
			mp = new MimeMultipart();
		}
		catch (Exception e)
		{
//			System.err.println("����MIME�ʼ�����ʧ�ܣ�" + e);
			return false;
		}
		return true;
	}
	/**
	 * ����SMTP�������֤
	 */
	public void setNeedAuth(boolean need)
	{
//		System.out.println("����smtp�����֤��mail.smtp.auth = " + need);
		if (props == null)
		{
			props = System.getProperties();
		}
		if (need)
			props.put("mail.smtp.auth", "true");
		else
			props.put("mail.smtp.auth", "false");
	}
	/**
	 * �����û������֤ʱ�������û���������
	 */
	public void setNamePass(String name, String pass)
	{
//		System.out.println("����õ��û���������");
		username = name;
		password = pass;
	}
	/**
	 * �����ʼ�����
	 * 
	 * @param mailSubject
	 * @return
	 */
	public boolean setSubject(String mailSubject)
	{
//		System.out.println("�����ʼ����⣡");
		try
		{
			mimeMsg.setSubject(mailSubject);
		}
		catch (Exception e)
		{
//			System.err.println("�����ʼ����ⷢ������");
			return false;
		}
		return true;
	}
	/**
	 * �����ʼ�����,��������Ϊ�ı���ʽ��HTML�ļ���ʽ�����뷽ʽΪUTF-8
	 * 
	 * @param mailBody
	 * @return
	 */
	public boolean setBody(String mailBody)
	{
		try
		{
			//System.out.println("�����ʼ����ʽ");
			//String mailBody="your query results from 'flysnp' are in attachment If you have any question, please feel free to contact 12210240084@fudan.edu.cn Thanks.fly-database http://www.iipl.fudan.edu.cn/snpweb/";
			BodyPart bp = new MimeBodyPart();
			bp.setContent("<meta http-equiv=Content-Type content=text/html; charset=UTF-8>" + mailBody,"text/html;charset=UTF-8");
			// �����������ʼ��ı�
			mp.addBodyPart(bp);
		}
		catch (Exception e)
		{
			System.err.println("�����ʼ�����ʱ��������" + e);
			return false;
		}
		return true;
	}
	/**
	 * ���ӷ��͸���
	 * 
	 * @param filename
	 *            �ʼ������ĵ�ַ��ֻ���Ǳ�����ַ�������������ַ�������׳��쳣 
	 * @return
	 */
	public boolean addFileAffix(String filename)
	{
//		System.out.println("�����ʼ�������" + filename);
		try
		{
			BodyPart bp = new MimeBodyPart();
			FileDataSource fileds = new FileDataSource(filename);
			bp.setDataHandler(new DataHandler(fileds));
			// ���͵ĸ���ǰ����һ���û�����ǰ׺
			bp.setFileName(fileds.getName());
			// ��Ӹ���
			mp.addBodyPart(bp);
		}
		catch (Exception e)
		{
//			System.err.println("�����ʼ�������" + filename + "��������" + e);
			return false;
		}
		return true;
	}
	/**
	 * ���÷����˵�ַ
	 * 
	 * @param from
	 *            �����˵�ַ
	 * @return
	 */
	public boolean setFrom(String from)
	{
//		System.out.println("���÷����ˣ�");
		try
		{
			mimeMsg.setFrom(new InternetAddress(from));
		}
		catch (Exception e)
		{
			return false;
		}
		return true;
	}
	/**
	 * �����ռ��˵�ַ
	 * 
	 * @param to
	 *            �ռ��˵ĵ�ַ
	 * @return
	 */
	public boolean setTo(String to)
	{
//		System.out.println("����������");
		if (to == null)
			return false;
		try
		{
			mimeMsg.setRecipients(javax.mail.Message.RecipientType.TO, InternetAddress.parse(to));
		}
		catch (Exception e)
		{
			return false;
		}
		return true;
	}
	/**
	 * ���͸���
	 * 
	 * @param copyto
	 * @return
	 */
	public boolean setCopyTo(String copyto)
	{
//		System.out.println("���͸�����");
		if (copyto == null)
			return false;
		try
		{
			mimeMsg.setRecipients(javax.mail.Message.RecipientType.CC, InternetAddress.parse(copyto));
		}
		catch (Exception e)
		{
			return false;
		}
		return true;
	}
	/**
	 * �����ʼ�
	 * 
	 * @return
	 */
	public boolean sendout()
	{
		try
		{
			mimeMsg.setContent(mp);
			mimeMsg.saveChanges();
//			System.out.println("���ڷ����ʼ�....");
			Session mailSession = Session.getInstance(props, null);
			Transport transport = mailSession.getTransport("smtp");
//			System.out.print("1");
			// �����������ʼ������������������֤
			transport.connect((String) props.get("mail.smtp.host"), username, password);
//			System.out.print("2");
			// �����ʼ�
			transport.sendMessage(mimeMsg, mimeMsg.getRecipients(javax.mail.Message.RecipientType.TO));
		//	System.out.println("�����ʼ��ɹ���");
			transport.close();
		}
		catch (Exception e)
		{
			System.err.println("�ʼ�����ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public static void send(String FilePath,String MailAdd)
	{
		/**
		 *
		 *************����ע��********
		 *
		 *ע��  �ô˳����ʼ���������֧��smtp����  ��2006���Ժ������163�����ǲ�֧�ֵ�
		 *��֪��sina����  sohu���� qq����֧��  ����sina��qq������Ҫ�ֹ����ÿ����˹���	
		 *�����ڲ���ʱ���ʹ������������	
		 *sina�����smtp���÷�������
		 *��¼sina���� ���ε�� ��������--->�ʻ�--->POP/SMTP���� ��������ѡ��ѡ�� Ȼ�󱣴�
		 *
		 *************����ע��********
		 */
		mail themail = new mail("smtp.163.com");//������163����Ϊ����
		String mailbody = "Your results from 'FlyVar' are in attachment<br>If you have any questions, please feel free to contact yongchen13@fudan.edu.cn <br>Thanks.<br><br><br>fly-variantion<br>http://www.iipl.fudan.edu.cn/FlyVar/";
		themail.setNeedAuth(true);
		themail.setSubject("The results from <http://www.iipl.fudan.edu.cn/FlyVar/>");//�ʼ�����
		themail.setBody(mailbody);//�ʼ�����
		themail.setTo(MailAdd);//�ռ��˵�ַ
		themail.setFrom("flyvar@163.com");//�����˵�ַ
		String[] filepath_new=FilePath.split(" ");
		for(int i=0;i<filepath_new.length;i++)
			if(!"".equals(filepath_new[i]))
				themail.addFileAffix(filepath_new[i]);// �����ļ�·��,���磺C:/222.jpg,*ע��"/"��д���� ���û�п��Բ�д
		//themail.addFileAffix(FilePath.concat("_result"));
		themail.setNamePass("flyvar@163.com", "chenyong");//�����˵�ַ������ **��Ϊ��Ӧ��������
		themail.sendout();
//		System.out.print("3");

	}
	public static void send(String FilePath,String MailAdd,String bodyStringlink)
	{
		/**
		 *
		 *************����ע��********
		 *
		 *ע��  �ô˳����ʼ���������֧��smtp����  ��2006���Ժ������163�����ǲ�֧�ֵ�
		 *��֪��sina����  sohu���� qq����֧��  ����sina��qq������Ҫ�ֹ����ÿ����˹���	
		 *�����ڲ���ʱ���ʹ������������	
		 *sina�����smtp���÷�������
		 *��¼sina���� ���ε�� ��������--->�ʻ�--->POP/SMTP���� ��������ѡ��ѡ�� Ȼ�󱣴�
		 *
		 *************����ע��********
		 */
		String mailbody="";//<a href=\""+bodyStringlink+"\">"+bodyStringlink+"</a><br><br><br><br>If you have any questions, please feel free to contact yongchen13@fudan.edu.cn <br>Thanks.<br><br><br>fly-database<br>http://www.iipl.fudan.edu.cn/flysnp/";
		mail themail = new mail("smtp.163.com");//������163����Ϊ����
		mailbody = "Your results from 'FlyVar' are listed below:(Click the link to see the corresponding result)<br/>";
		String[] filepath_new=bodyStringlink.split(" ");
		for(int i=0;i<filepath_new.length;)
			if(!"".equals(filepath_new[i]))
				{
				mailbody+="<a href=\"http://www.iipl.fudan.edu.cn/FlyVar/myfiles/"+filepath_new[i]+"\">http://www.iipl.fudan.edu.cn/FlyVar/myfiles/"+filepath_new[i]+"</a>";
				if(++i<filepath_new.length)mailbody+="<br/>";
				}
		mailbody+="<br /><br /><br /><br />If you have any questions, please feel free to contact yongchen13@fudan.edu.cn <br />Thanks.<br /><br /><br />fly-variantion<br />http://www.iipl.fudan.edu.cn/FlyVar/";
		themail.setNeedAuth(true);
		themail.setSubject("The results from <http://www.iipl.fudan.edu.cn/FlyVar/>");//�ʼ�����
		themail.setBody(mailbody);//�ʼ�����
		themail.setTo(MailAdd);//�ռ��˵�ַ
		themail.setFrom("flyvar@163.com");//�����˵�ַ
		
		
		//themail.addFileAffix(FilePath.concat("_result"));
		themail.setNamePass("flyvar@163.com", "chenyong");//�����˵�ַ������ **��Ϊ��Ӧ��������
		themail.sendout();
//		System.out.print("3");

	}
	
	public static void send(String subject,String name,String contact,String content,String receiver)
	{
		/**
		 *
		 *************����ע��********
		 *
		 *ע��  �ô˳����ʼ���������֧��smtp����  ��2006���Ժ������163�����ǲ�֧�ֵ�
		 *��֪��sina����  sohu���� qq����֧��  ����sina��qq������Ҫ�ֹ����ÿ����˹���	
		 *�����ڲ���ʱ���ʹ������������	
		 *sina�����smtp���÷�������
		 *��¼sina���� ���ε�� ��������--->�ʻ�--->POP/SMTP���� ��������ѡ��ѡ�� Ȼ�󱣴�
		 *
		 *************����ע��********
		 */
		String mailbody="";//<a href=\""+bodyStringlink+"\">"+bodyStringlink+"</a><br><br><br><br>If you have any questions, please feel free to contact yongchen13@fudan.edu.cn <br>Thanks.<br><br><br>fly-database<br>http://www.iipl.fudan.edu.cn/flysnp/";
		mail themail = new mail("smtp.163.com");//������163����Ϊ����
		mailbody = "Sender:"+name+"<br/>"+"Contact:"+contact+"<br/>"+"Message:"+content;
		themail.setNeedAuth(true);
		themail.setSubject("feedback from frederik website\"Subject:"+subject+"\"");//�ʼ�����
		themail.setBody(mailbody);//�ʼ�����
		themail.setTo(receiver);//�ռ��˵�ַ
		themail.setFrom("flyvar@163.com");//�����˵�ַ
		themail.setNamePass("flyvar@163.com", "chenyong");//�����˵�ַ������ **��Ϊ��Ӧ��������
		themail.sendout();

	}
}
