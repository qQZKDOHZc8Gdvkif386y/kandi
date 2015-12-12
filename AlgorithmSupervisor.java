import java.util.Arrays;

public class AlgorithmSupervisor {
  public static void main (String []args) {
    int[] testArray = {5,4,3,2,1};
    int[] correctOutput = {1,2,3,4,5};
    NonDecreasingInsertionSortAlgoritm insertionSort = new NonDecreasingInsertionSortAlgorithm(testArray, correctOutput);
    System.out.println("Insertion Sort:");
    System.out.println(Arrays.toString(insertionSort.runAlgorithm));
  }


public class Algorithm {
  private int[] correctOutput;
  private int[] input;
  
  public Algorithm(int[] input, int[] correctOutput) {
    this.input = input;
    this.correctOutput = correctOutput;
  }

  public static int[] runAlgorithm () {
    return this.input;
  } 
}

public class NonDecreasingInsertionSortAlgorithm extends Algorithm {
  public static int[] runAlgorithm () {
    int[] array = this.input;
    // place every member k into the sorted subarray 1..k-1
    for (int toInsert = 1; toInsert < array.length; toInsert++) {
      int value = array[toInsert];
      int compareTo = toInsert - 1;
      // compare the value of k to every member in the sorted
      // subarray 1..k-1, inserting k to the right of the first
      // member smaller than it
      while (compareTo >= 0 && value < array[compareTo]) {
        array[compareTo + 1] = array[compareTo];
        compareTo--; 
      }
      array[compareTo + 1] = value; 
    }
    return array;
  }
}

}
