<?php

use App\Http\Controllers\Api\Profile\ProfileController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Games\GameController;
use App\Models\Promocao;
use App\Http\Controllers\MissionController;
use App\Http\Controllers\VipController;


/*
|--------------------------------------------------------------------------
| ROTA DAS MISSÕES
|--------------------------------------------------------------------------

*/





/*
|--------------------------------------------------------------------------
| ROTA DAS PROMOÇÕES
|--------------------------------------------------------------------------

*/


Route::get('/promocoes', function () {
    return Promocao::all();
});

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::prefix('jogos')->group(function () {
    // Rota para listar todos os jogos
    Route::get('/list', [GameController::class, 'listarTodos']);

    // Rota para buscar jogos por nome
    Route::get('/buscar', [GameController::class, 'buscarPorNome']);

    // Rota para buscar jogos por categoria
    Route::get('/categorias', [GameController::class, 'buscarPorCategoria']);

    // Rota para buscar jogos por provedora
    Route::get('/provedora', [GameController::class, 'buscarPorProvedora']);
});


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


/*
 * Auth Route with JWT
 */
Route::group(['prefix' => 'auth', 'as' => 'auth.'], function () {
    include_once(__DIR__ . '/groups/api/auth/auth.php');
});

Route::group(['middleware' => ['auth.jwt']], function () {
    
    
    
    Route::prefix('missions')
        ->group(function () {
            Route::get('/', [MissionController::class, 'index']); // Lista missões
            Route::post('/{missionId}/progress', [MissionController::class, 'updateProgress']); // Atualiza progresso
            Route::post('/{missionId}/redeem', [MissionController::class, 'redeemReward']); // Resgata recompensa
            Route::get('/{missionId}/check', [MissionController::class, 'checkIfRedeemed']); // Verifica se foi resgatada
        });

    Route::prefix('vips')
        ->group(function () {
            Route::get('/', [VipController::class, 'getVipsWithProgress']); // Lista níveis VIP com progresso
            Route::post('/{vipId}/claim', [VipController::class, 'claimVipReward']); // Resgata recompensa semanal
        });

        
    Route::prefix('profile')
        ->group(function ()
        {
            include_once(__DIR__ . '/groups/api/profile/profile.php');
            include_once(__DIR__ . '/groups/api/profile/affiliates.php');
            include_once(__DIR__ . '/groups/api/profile/wallet.php');
            include_once(__DIR__ . '/groups/api/profile/likes.php');
            include_once(__DIR__ . '/groups/api/profile/favorites.php');
            include_once(__DIR__ . '/groups/api/profile/recents.php');
            include_once(__DIR__ . '/groups/api/profile/vip.php');
        });

    Route::prefix('wallet')
        ->group(function ()
        {
            include_once(__DIR__ . '/groups/api/wallet/deposit.php');
            include_once(__DIR__ . '/groups/api/wallet/withdraw.php');
        });
});


Route::prefix('categories')
    ->group(function ()
    {
        include_once(__DIR__ . '/groups/api/categories/index.php');;
    });

include_once(__DIR__ . '/groups/api/games/index.php');
include_once(__DIR__ . '/groups/api/gateways/suitpay.php');

Route::prefix('search')
    ->group(function ()
    {
        include_once(__DIR__ . '/groups/api/search/search.php');
    });

Route::prefix('profile')
    ->group(function ()
    {
        Route::post('/getLanguage', [ProfileController::class, 'getLanguage']);
        Route::put('/updateLanguage', [ProfileController::class, 'updateLanguage']);
    });

Route::prefix('providers')
    ->group(function ()
    {

    });


Route::prefix('settings')
    ->group(function ()
    {
        include_once(__DIR__ . '/groups/api/settings/settings.php');
        include_once(__DIR__ . '/groups/api/settings/banners.php');
        include_once(__DIR__ . '/groups/api/settings/currency.php');
        include_once(__DIR__ . '/groups/api/settings/bonus.php');
    });

// LANDING SPIN
Route::prefix('spin')
    ->group(function ()
    {
        include_once(__DIR__ . '/groups/api/spin/index.php');
    })
    ->name('landing.spin.');
