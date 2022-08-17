import java.util.Arrays;
import java.util.stream.Stream;
import java.util.List;
import java.util.stream.Collectors;
import java.lang.reflect.Method; 
import java.lang.reflect.Field; 
import java.io.*;

public class GenerateProducts {
    public static final String listStart = "<ul>";
    public static final String listEnd = "</ul>";
    public static final String itemStart = "<li>";
    public static final String itemEnd = "</li>";

    public static void main(String[] args) throws Exception {
        Class<?> products = Products.class;
        Class<?> product = Product.class;
        Object dummy = products.getDeclaredConstructor().newInstance();

        clearFiles("products");
        PrintStream out = new PrintStream(new FileOutputStream("index.html", true));

        Method[] methods = products.getMethods();
        Stream<Method> stream1 = Arrays.stream(methods);
        List<Method> productList = Arrays.stream(methods)
                .filter(line -> line.getReturnType().equals(product))
                .collect(Collectors.toList());

        for (Method m : productList) {
            // Get info about the product
            Product p = (Product)m.invoke(dummy);
            String name = p.getName();
            String description = p.getDescription();
            String picture = p.getPicture();
            double price = p.getPrice();

            // Create new file
            File productFile = new File("products/" + name + ".html");
            productFile.createNewFile();
            PrintStream outProductFile = new PrintStream(productFile);
            printHeader(outProductFile, name);

            out.println(indent(5) + itemStart + "<a class=\"entry\" href=\"products/" + name + ".html\">" + name + "</a>" + itemEnd);

            outProductFile.println(indent(3) + listStart);
            outProductFile.println(indent(4) + itemStart + "<span class=\"about\">Product Description: " +  description + "</span>" + itemEnd);
            outProductFile.println(indent(4) + itemStart + "<span class=\"about\">Price: $" + price + "</span>" + itemEnd);
            outProductFile.println(indent(4) +  "<img src=\"" + "../images/products/" + picture + "\" target=\"_blank\"></img>");
            outProductFile.println(indent(3) + listEnd);

            printFooter(outProductFile);
        }

        out.close();
    }

    private static void clearFiles(String dir) {
        File currentDir = new File(dir);

        if (!currentDir.exists())
            currentDir.mkdir();

        for (File f : currentDir.listFiles()) {
            if (f.getName().endsWith(".html")) {
                f.delete();
            }
        }
    }

    private static void printHeader(PrintStream out, String title) {
        out.println("<html>");
        out.println(indent(1) + "<head>");
        out.println(indent(2) + "<link rel=\"stylesheet\" href=\"../assets/style.css\">");
        out.println(indent(2) + "<title>" + title + "</title>");
        out.println(indent(1) + "</head>");
        out.println(indent(1) + "<body>");
        out.println(indent(2) + "<h1>" + title + "</h1>");
    }

    private static void printFooter(PrintStream out) {
        out.println(indent(2) + listEnd);
        out.println(indent(1) + "</body>");
        out.println("</html>");
    }

    private static String indent(int n) {
        String s = "";
        for (int i = 0; i < n * 4; i++) {
            s += " ";
        }
        return s;
    }
}
