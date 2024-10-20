package example;

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.xml.ws.Endpoint;

@WebService()
public class TaxCalculation {
    @WebMethod
    public double taxCalculation(double salary) {
        if (salary <= 0) {
            System.out.printf("工资应大于0");
            return -1;
        }
        double tax = 0;
        if (salary <= 5000) {
            tax = 0;
        } else if (salary <= 8000) {
            tax = (salary - 5000) * 0.03;
        } else if (salary <= 17000) {
            tax = (3000 * 0.03) + (salary - 8000) * 0.1;
        } else if (salary <= 30000) {
            tax = (3000 * 0.03) + (9000 * 0.1) + (salary - 17000) * 0.2;
        } else if (salary <= 40000) {
            tax = (3000 * 0.03) + (9000 * 0.1) + (13000 * 0.2) + (salary - 30000) * 0.25;
        } else if (salary <= 60000) {
            tax = (3000 * 0.03) + (9000 * 0.1) + (13000 * 0.2) + (10000 * 0.25) + (salary - 40000) * 0.3;
        } else if (salary <= 85000) {
            tax = (3000 * 0.03) + (9000 * 0.1) + (13000 * 0.2) + (10000 * 0.25) + (20000 * 0.3) + (salary - 60000) * 0.35;
        } else {
            tax = (3000 * 0.03) + (9000 * 0.1) + (13000 * 0.2) + (10000 * 0.25) + (20000 * 0.3) + (25000 * 0.35) + (salary - 85000) * 0.45;
        }
        System.out.printf("工资：%.2f元，个人所得税：%.2f元%n", salary, tax);
        return tax;
    }

    public static void main(String[] args) {
        Object implementor = new TaxCalculation();
        String address = "http://localhost:8088/TaxCalculation";
        Endpoint.publish(address, implementor);
    }
}
