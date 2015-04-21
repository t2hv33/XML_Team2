/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package util;

import generate.jaxb.product.Allproduct;
import generate.jaxb.product.ProductType;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

/**
 *
 * @author duy
 */
public class Marshall {

    

    public static  void marshall(String fileName, Object obj) {
        System.out.println("Vao marshall roi kekekeke!!!");
        try {
            JAXBContext jaxb = JAXBContext.newInstance(obj.getClass());
            Marshaller mar = jaxb.createMarshaller();
            mar.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
            mar.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
            mar.marshal(obj, new File(fileName));
        } catch (JAXBException ex) {
            System.out.println("Duong dan dau");
            ex.printStackTrace();
        }
    }

}
