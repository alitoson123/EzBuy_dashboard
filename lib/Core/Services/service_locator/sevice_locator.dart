import 'package:e_commerce_dash_board_app/Core/Services/ARUD_data_service/ARUD_data.dart';
import 'package:e_commerce_dash_board_app/Core/Services/Storage_service/supabase_storage_service.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Data/Add_product_repo_impl/add_product_repo_impl.dart';
import 'package:e_commerce_dash_board_app/Features/Add_product/Domain/Add_product_repo/add_product_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AddProductRepo>(
    AddProductRepoImpl(
        arudData: ArudData(), supabaseStorageService: SupabaseStorageService()),
  );
}
