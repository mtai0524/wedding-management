using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodeFirst.Migrations
{
    /// <inheritdoc />
    public partial class updateFkNullServiceEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ServiceEntity_ServiceCategory_CategoryId",
                table: "ServiceEntity");

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "ServiceEntity",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_ServiceEntity_ServiceCategory_CategoryId",
                table: "ServiceEntity",
                column: "CategoryId",
                principalTable: "ServiceCategory",
                principalColumn: "CategoryId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_ServiceEntity_ServiceCategory_CategoryId",
                table: "ServiceEntity");

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "ServiceEntity",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_ServiceEntity_ServiceCategory_CategoryId",
                table: "ServiceEntity",
                column: "CategoryId",
                principalTable: "ServiceCategory",
                principalColumn: "CategoryId");
        }
    }
}
