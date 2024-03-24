/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package GRPAHGENERATION;

/**
 *
 * @author alaguraj
 */
import java.util.LinkedList;
import java.util.Queue;

public class BipartiteGraphs {

    public static void main(String[] args) {
        boolean[][] adj = new boolean[4][4];
        adj[0][1] = true;
        adj[1][0] = true;
        adj[1][2] = true;
        adj[2][1] = true;
        adj[0][3] = true;
        adj[3][0] = true;
        adj[1][3] = true;
        adj[3][1] = true;
        System.out.println(check(adj));
    }

    public static boolean check(boolean[][] adj) {
        int[] colors = new int[adj.length];
        Queue<Integer> q = new LinkedList<Integer>();
        colors[0] = 1;
        q.add(0);
        while (!q.isEmpty()) {
            int t = q.poll();
            int expected;
            if (colors[t] == 1) {
                expected = 2;
            } else {
                expected = 1;
            }
            for (int i = 0; i < adj[t].length; i++) {
                if (adj[t][i]) {
                    if (colors[i] != 0) {
                        if (colors[i] != expected) {
                            return false;
                        }
                    } else {
                        colors[i] = expected;
                        q.add(i);
                    }
                }
            }
        }
        return true;
    }
}
