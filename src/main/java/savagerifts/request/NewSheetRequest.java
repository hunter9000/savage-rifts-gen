package savagerifts.request;

public class NewSheetRequest {
    public String characterName;
    public Long frameworkId;

    public boolean validate() {
        return characterName != null && !characterName.equals("") && frameworkId != null;
    }
}
