component {

    this.name = "flexiTags";
    this.applicationTimeout = CreateTimeSpan(1, 0, 0, 0); //10 days
    this.datasource = "movielist";
    this.sessionManagement = true;
    this.sessionTimeout = CreateTimeSpan(0, 0, 30, 0); //30 minutes
    this.customTagPaths = "#expandPath('tags')#";

}