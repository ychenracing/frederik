package cn.edu.fudan.function;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class ConvertVideoTypeThread extends Thread {
	private String videoPath;
	private String fileName;
	public ConvertVideoTypeThread(String videoPath,String fileName){
		this.videoPath=videoPath;
		this.fileName=fileName;
	}
	public void run(){
		ConvertSingleVideo conver = new ConvertSingleVideo(videoPath);
		conver.convert(conver.inputFile_home + fileName,conver.outputFile_home+ fileName.substring(0,fileName.lastIndexOf("."))+ ".mp4");
//		File file=new File("testVideoPath.txt");
//		try {   
//			    if(!file.exists())
//				    file.createNewFile();
//				FileWriter fw=new FileWriter(file);
//				fw.write("ConvertVideoTypeThread:"+conver.inputFile_home + fileName+"\n");
//				fw.flush();
//				fw.close();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		file=null;
		conver=null;
	}
}
