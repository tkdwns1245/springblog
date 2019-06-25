package myblog;

public class Research {
	private int id;
	private int gender;
	private int age;
	private int background;
	private int marry;
	private String blood;
	private int q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,sum = 0;

	public String getBlood() {
		return blood;
	}
	public void setBlood(String blood) {
		this.blood = blood;
	}
	public int getQ1() {
		return q1;
	}
	public void setQ1(int q1) {
		this.q1 = q1;
	}
	public int getQ2() {
		return q2;
	}
	public void setQ2(int q2) {
		this.q2 = q2;
	}
	public int getQ3() {
		return q3;
	}
	public void setQ3(int q3) {
		this.q3 = q3;
	}
	public int getQ4() {
		return q4;
	}
	public void setQ4(int q4) {
		this.q4 = q4;
	}
	public int getQ5() {
		return q5;
	}
	public void setQ5(int q5) {
		this.q5 = q5;
	}
	public int getQ6() {
		return q6;
	}
	public void setQ6(int q6) {
		this.q6 = q6;
	}
	public int getQ7() {
		return q7;
	}
	public void setQ7(int q7) {
		this.q7 = q7;
	}
	public int getQ8() {
		return q8;
	}
	public void setQ8(int q8) {
		this.q8 = q8;
	}
	public int getQ9() {
		return q9;
	}
	public void setQ9(int q9) {
		this.q9 = q9;
	}
	public int getQ10() {
		return q10;
	}
	public void setQ10(int q10) {
		this.q10 = q10;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int q1,int q2,int q3, int q4, int q5, int q6, int q7, int q8, int q9, int q10) {
		if(q1==3)
			sum+=10;
		if(q2==3)
			sum+=10;
		if(q3==1)
			sum+=10;
		if(q4==2)
			sum+=10;
		if(q5==3)
			sum+=10;
		if(q6==1)
			sum+=10;
		if(q7==2)
			sum+=10;
		if(q8==3)
			sum+=10;
		if(q9==2)
			sum+=10;
		if(q10==1)
			sum+=10;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getBackground() {
		return background;
	}
	public void setBackground(int background) {
		this.background = background;
	}
	public int getMarry() {
		return marry;
	}
	public void setMarry(int marry) {
		this.marry = marry;
	}
	
	
}
