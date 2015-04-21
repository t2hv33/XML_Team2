/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import com.sun.codemodel.JCodeModel;
import com.sun.tools.xjc.api.ErrorListener;
import com.sun.tools.xjc.api.S2JJAXBModel;
import com.sun.tools.xjc.api.SchemaCompiler;
import com.sun.tools.xjc.api.XJC;
import java.io.File;
import java.io.IOException;
import org.xml.sax.InputSource;
import org.xml.sax.SAXParseException;

/**
 *
 * @author duy
 */
public class GenJavaObj {

    public static void GenerateJavaObj(String packagename, File schema) {
        try {
            String output = "src/java/";
            SchemaCompiler sc = XJC.createSchemaCompiler();
            sc.setErrorListener(new ErrorListener() {

                public void error(SAXParseException saxpe) {
                    System.out.println("error " + saxpe.getMessage());
                }

                public void fatalError(SAXParseException saxpe) {
                    System.out.println("fatal " + saxpe.getMessage());
                }

                public void warning(SAXParseException saxpe) {
                    System.out.println("warning " + saxpe.getMessage());
                }

                public void info(SAXParseException saxpe) {
                    System.out.println("info " + saxpe.getMessage());
                }
            });
            sc.forcePackageName("generate.jaxb." + packagename);
            InputSource is = new InputSource(schema.toURI().toString());
            sc.parseSchema(is);
            S2JJAXBModel model = sc.bind();
            JCodeModel code = model.generateCode(null, null);
            code.build(new File(output));
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }

    public static void main(String[] args) {
//        File schemaProduct = new File("src/java/schema/Products.xsd");
//        GenerateJavaObj("product", schemaProduct);

        File schemaProduct = new File("src/java/schema/Users.xsd");
        GenerateJavaObj("users", schemaProduct);

    }
}
