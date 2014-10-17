package cn.edu.fudan.function;

import java.security.MessageDigest;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
/**
 * aim at converting datatype,including Map2Json,Json2Map,get timestamp,String2MD5
 * @author Yong Chen
 *
 */
public class DataTypeConverter {
	
	public static void main(String[] args){
		//ConvertSingleVideo conver = new ConvertSingleVideo("E:/videoConvertTools/movie.avi");
		//conver.convert(conver.inputFile_home + "movie.avi",conver.outputFile_home+ "movie.avi".substring(0,"movie.avi".lastIndexOf("."))+ ".mp4");
		//String string="movie.mp4";
		//System.out.print(string.substring(0, string.lastIndexOf(".")));
		DataTypeConverter dtc=new DataTypeConverter();
		Map<String,String> m=dtc.convertJsonToMap("{\"ss\":\"a\"}");
		System.out.println(m.get("ss"));
	}
	/**
	 * convert a json type data to a map
	 * @param data
	 * @return map
	 */
	public Map<String, String> convertJsonToMap(String data){
        GsonBuilder gb = new GsonBuilder();
        Gson g = gb.create();
        Map<String, String> map = g.fromJson(data, new TypeToken<Map<String, String>>() {}.getType());
        return map;
    }
	
	/**
	 * convert map type to a json data
	 * @param data
	 * @return string of json type
	 */
	public String convertMapToJson(Map<String, String> map){
        GsonBuilder gb = new GsonBuilder();
        Gson g = gb.create();
        String json = g.toJson(map);
        return json;
    }
	
	/**
	 * get timestamp now
	 * @return string
	 */
	public String getTimestampNow(){
		Date date=new Date();
		Timestamp ts=new Timestamp(date.getTime());
		return ts.toString();
	}
	
	/**
	 * convert a string to MD5(32bit)
	 * @param string
	 * @return MD5(32bit)
	 */
	public String convertStringToMD5(String string){
		String myMD5=getMD5(string);
		return myMD5;
	}
	
	public String getMD5(String pwd) {
		//将字符串转换为字节数组
		byte[] toChapter = null;;  
		//md5str用来保存字节数组转换成的十六进制数
		StringBuffer md5str = new StringBuffer();
		try{
			toChapter=pwd.getBytes("UTF-8");
			//得到一个实现特定摘要算法的消息摘要对象
			MessageDigest md5 = MessageDigest.getInstance( "MD5" );
	        //将字节数组toChapter添加到待计算MD5值的字节序列中
			md5.update(toChapter);  
			//计算字节序列的MD5值，返回16个字节的字节数组，保存到toChapterDigest
	        byte[] toChapterDigest = md5.digest();
	        
	        //每个8位的二进制字节用十六进制表示的话，需要两个字符，每个十六进制字符对应四位二进制位
	        //故16个字节(128bit)转换后，变为了32个字符的字符串，将它们添加到md5str中
	        
	        int digital;
			for (int i = 0; i <toChapterDigest.length; i++) {
				digital =toChapterDigest[i];
				//这里字节类型赋值给int类型，会按符号位扩展的
				//如果字节的最高位是1，扩展为int时它的高位(9-32位)都会变为1
				if(digital < 0) {
					//将8位字节之前的高位全变为0
					digital += 256;
				}
				if(digital < 16){
					md5str.append("0");
				}
				//经过判断之后的操作，能保证digtal转换为十六进制字符的时候只得到两位
				md5str.append(Integer.toHexString(digital));
			}
		}catch( Exception e ) {     
	           throw new RuntimeException(e);
	    }
		//返回十六进制字符串
		return md5str.toString();
	}
}
