package cn.edu.fudan.function;

import java.io.File;

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
		//File file=new File(videoPath);
		//if(file.exists())file.delete();
		//file=null;
		conver=null;
	}
}
