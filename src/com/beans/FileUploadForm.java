package com.beans; // Adjust package as needed

import org.springframework.web.multipart.MultipartFile;

public class FileUploadForm {
    private MultipartFile resumeFile;

    public MultipartFile getResumeFile() {
        return resumeFile;
    }

    public void setResumeFile(MultipartFile resumeFile) {
        this.resumeFile = resumeFile;
    }
}
