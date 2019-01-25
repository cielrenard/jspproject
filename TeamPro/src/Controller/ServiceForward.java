package Controller;

public class ServiceForward {
	private boolean isRedirect = false;
	private String path = null;

	public boolean isRedirect() {
		return isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;

	}

	public void setRedirect(boolean is) {
		isRedirect = is;
	}
}
