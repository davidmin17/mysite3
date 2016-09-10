package kr.co.saramin.mysite.exception;

public class FileUploadServiceException extends RuntimeException {

	private static final long serialVersionUID = -6716593253370500217L;

	public FileUploadServiceException (String message) {
		
	}
	
public FileUploadServiceException () {
		super("FileUploadService Exception Occurs");
	}
}
