class CheckIsWinnerFunc {
  // Fungsi untuk mendeteksi pemenang dalam Tic Tac Toe 7x10
  /// 1 untuk player 1, 2 untuk player 2, null untuk belum ada pemenang
  static String? call(List<List<String>> board) {
    // Cek baris
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 7 - 3; j++) {
        if (board[i][j] != '.' &&
            board[i][j] == board[i][j + 1] &&
            board[i][j] == board[i][j + 2] &&
            board[i][j] == board[i][j + 3]) {
          return board[i][j]; // Pemain menang
        }
      }
    }

    // Cek kolom
    for (int i = 0; i < 10 - 3; i++) {
      for (int j = 0; j < 7; j++) {
        if (board[i][j] != '.' &&
            board[i][j] == board[i + 1][j] &&
            board[i][j] == board[i + 2][j] &&
            board[i][j] == board[i + 3][j]) {
          return board[i][j]; // Pemain menang
        }
      }
    }

    // Cek diagonal kanan bawah
    for (int i = 0; i < 10 - 3; i++) {
      for (int j = 0; j < 7 - 3; j++) {
        if (board[i][j] != '.' &&
            board[i][j] == board[i + 1][j + 1] &&
            board[i][j] == board[i + 2][j + 2] &&
            board[i][j] == board[i + 3][j + 3]) {
          return board[i][j]; // Pemain menang
        }
      }
    }

    // Cek diagonal kiri bawah
    for (int i = 0; i < 10 - 3; i++) {
      for (int j = 3; j < 7; j++) {
        if (board[i][j] != '.' &&
            board[i][j] == board[i + 1][j - 1] &&
            board[i][j] == board[i + 2][j - 2] &&
            board[i][j] == board[i + 3][j - 3]) {
          return board[i][j]; // Pemain menang
        }
      }
    }

    return null; // Belum ada pemenang
  }
}
